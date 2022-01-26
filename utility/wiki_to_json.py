#!/usr/bin/env python3

import requests
import wikitextparser as wtp
import time
import sys
import re
import json

sleep_time = 0.25

page_templates = ['ST1-{:02d}', 'ST2-{:02d}', 'ST3-{:02d}', 'ST4-{:02d}', 'ST5-{:02d}', 'ST6-{:02d}', 'ST7-{:02d}', 'ST8-{:02d}', 'ST9-{:02d}', 'ST10-{:02d}',   'P-{:03d}', 'BT1-{:03d}', 'BT2-{:03d}', 'BT3-{:03d}', 'BT4-{:03d}', 'BT5-{:03d}', 'BT6-{:03d}', 'EX1-{:03d}', 'BT7-{:03d}', 'BT8-{:03d}', 'EX2-{:03d}']

series_name_list = ["ST-1: Gaia Red", "ST-2: Cocytus Blue", "ST-3: Heaven's Yellow", "ST-4: Giga Green", "ST-5: Mugen Black", "ST-6: Venomous Violet", "ST-7: Gallantmon", "ST-8: UlforceVeedramon", "ST-9: Ultimate Ancient Dragon", "ST-10: Parallel World Tactician", "Promo: Promotional Cards", "BT-01: New Evolution", "BT-02: Ultimate Power", "BT-03: Union Impact", "BT-04: Great Legend", "BT-05: Battle of Omega", "BT-06: Double Diamond", "EX-01: Classic Collection", "BT-07: Next Aventure", "BT-08: New Hero", "EX-02: Digital Hazard"]

card_template = "https://digimoncardgame.fandom.com/api.php?action=parse&page={0}&prop=wikitext&format=json"
ruling_template = "https://digimoncardgame.fandom.com/api.php?action=parse&page=Card_Rulings:{0}&prop=wikitext&format=json"

card_wikitex_replaces = {
    '・': '·',
    '\"': '\\"',
    '\n': '',
    '<br>': '\\n',
    '<br/>': '\\n',
    ' = ': '=',
}

ruling_wikitex_replaces = {
    '<sup>1</sup>': '',
    '・': '·',
    '\"': '\\"',
    '\n': '',
    '<br>': '\\n',
    '<br/>': '\\n',
}

def multiple_replace(string, rep_dict):
    pattern = re.compile("|".join([re.escape(k) for k in sorted(rep_dict,key=len,reverse=True)]), flags=re.DOTALL)
    return pattern.sub(lambda x: rep_dict[x.group(0)], string)


def wikitext_to_dict(card_wikitext, ruling_wikitext) -> dict:
    card_data = {}

    # Card data
    card_wikitext = multiple_replace(card_wikitext, card_wikitex_replaces)
    parsed_data = wtp.parse(card_wikitext)

    for template in parsed_data.templates:
        if template.name == 'CardTable':
            for argument in template.arguments:
                arg_name = argument.name.strip()
                arg_value = argument.value.strip()
                if not arg_value:
                    continue

                if arg_name == 'ensets' or arg_name == 'jpsets' or arg_name == 'allsets':
                    parsed_sets = wtp.parse(arg_value)
                    # Set rarity if not defined and if it is not Alt
                    rarity = parsed_sets.templates[0].arguments[1].value.strip()
                    if not 'rarity' in card_data and 'Alt' != rarity:
                        card_data['rarity'] = rarity
                    # Save the list of boosters
                    set_arr = []
                    for t in parsed_sets.templates:
                        set_arr.append(t.arguments[0].value)
                    card_data[arg_name] = set_arr

                else:
                    card_data[arg_name] = arg_value
    has_evo_data = bool('evocost' in card_data and card_data['evocost'])
    if has_evo_data and 'evolvl' not in card_data:
        card_data['evolvl'] = str(int(card_data['level']) - 1)
    if has_evo_data and 'evocol' not in card_data:
        card_data['evocol'] = card_data['colour']
    
    has_evo_data = bool('evocost2' in card_data and card_data['evocost2'])
    if has_evo_data and 'evolvl2' not in card_data:
        card_data['evolvl2'] = str(int(card_data['level']) - 1)
    if has_evo_data and 'evocol2' not in card_data:
        card_data['evocol2'] = card_data['colour']

    ruling_wikitext = multiple_replace(ruling_wikitext, card_wikitex_replaces)
    parsed_data = wtp.parse(ruling_wikitext)

    ruling_arr = []
    for template in parsed_data.templates:
        if template.name == 'Ruling':
            for argument in template.arguments:
                ruling_arr.append(argument.value)

    if ruling_arr:
        card_data['ruling'] = ruling_arr
    
    return card_data


def main():
    
    if len(page_templates) != len(series_name_list):
        print("Error: the page list and series name list differ in length")
        sys.exit(1)
    #
    if len(sys.argv) < 2:
        print("Use the following numbers to choose which ones to download:")
        for idx, name in enumerate(series_name_list):
            print(idx, name)
        print("\nUsage:")
        print("wiki_to_json.py --all")
        print("wiki_to_json.py 1 4 5")
        
        sys.exit(0)
    
    booster_indices = []
    if sys.argv[1] == "--all":
        booster_indices = list(range(len(page_templates)))
    else:
        booster_indices = sys.argv[1:]
    #
    
    session = requests.Session()
    for idx in booster_indices:
        idx = int(idx)
        page_template = page_templates[idx]
        # data for all the cards of a single series
        json_data = {}
        name = series_name_list[idx]
        json_data['name'] = name
        json_data['shortname'] = name[0:name.find(':', 1)]
        card_list = []

        page_index = 0
        while True:
            page_index += 1
            if page_index != 1:
                time.sleep(sleep_time)
            
            page_id = page_template.format(page_index)
            
            # Card
            response = session.get(card_template.format(page_id))
            if response.status_code != 200:
                print("HTTP error")
                sys.exit(1)

            json_response = response.json()
            if 'error' in json_response:
                break
            else:
                print(page_id)
            card_wikitext = json_response['parse']['wikitext']['*']
            
            
            # Ruling
            time.sleep(sleep_time)
            response = session.get(ruling_template.format(page_id))
            if response.status_code != 200:
                print("HTTP error")
                sys.exit(1)

            json_response = response.json()
            if 'error' in json_response:
                ruling_wikitext = ""
            else:
                ruling_wikitext = json_response['parse']['wikitext']['*']
            
            data_dict = wikitext_to_dict(card_wikitext, ruling_wikitext)
            # Ensure all the cards have ID
            data_dict['setnumber'] = page_id
            card_list.append(data_dict)

        json_data['cards'] = card_list

        file = open(json_data['shortname'] + ".json", "w")
        file.write(json.dumps(json_data, sort_keys=False, indent=4, ensure_ascii=False)) 
        file.close() 


if __name__ == "__main__":
    main()
