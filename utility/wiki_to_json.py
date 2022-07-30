#!/usr/bin/env python3

import json
from bs4 import BeautifulSoup, NavigableString
import urllib.request
import sys
import time


URL_BASE_DIGI = "https://digimoncardgame.fandom.com/wiki/"
URL_BASE_RULING = "https://digimoncardgame.fandom.com/wiki/Card_Rulings:"

sleep_time = 0.20

page_templates = ['ST1-{:02d}', 'ST2-{:02d}', 'ST3-{:02d}', 'ST4-{:02d}', 'ST5-{:02d}', 'ST6-{:02d}',
    'ST7-{:02d}', 'ST8-{:02d}', 'ST9-{:02d}', 'ST10-{:02d}', 'ST12-{:02d}', 'ST13-{:02d}', 'P-{:03d}', 'BT1-{:03d}', 'BT2-{:03d}',
    'BT3-{:03d}', 'BT4-{:03d}', 'BT5-{:03d}', 'BT6-{:03d}', 'EX1-{:03d}', 'BT7-{:03d}', 'BT8-{:03d}',
    'EX2-{:03d}', 'BT9-{:03d}', 'BT10-{:03d}',
    'EX3-{:03d}']

series_name_list = ["ST-1: Gaia Red", "ST-2: Cocytus Blue", "ST-3: Heaven's Yellow",
    "ST-4: Giga Green", "ST-5: Mugen Black", "ST-6: Venomous Violet", "ST-7: Gallantmon",
    "ST-8: UlforceVeedramon", "ST-9: Ultimate Ancient Dragon", "ST-10: Parallel World Tactician",
    "ST-12: Starter Deck Jesmon", "ST-13: Starter Deck RagnaLoardmon", "Promo: Promotional Cards", "BT-01: New Evolution", "BT-02: Ultimate Power", "BT-03: Union Impact", "BT-04: Great Legend", "BT-05: Battle of Omega", "BT-06: Double Diamond", "EX-01: Classic Collection", "BT-07: Next Aventure", "BT-08: New Hero", "EX-02: Digital Hazard", "BT-09: X Record", "BT-10: Xros Encounter", "EX-03: Draconic Roar"]


def get_set_name(set_index):
    return series_name_list[set_index].split(':')[0]


def parse_rulings(id, res):
    ruling = []

    time.sleep(sleep_time)
    req = urllib.request.Request(URL_BASE_RULING + id, headers={'User-Agent': 'Mozilla/5.0'})
    try:
        f = urllib.request.urlopen(req)
    except:
        return
    s = BeautifulSoup(f, 'lxml')

    parser_output = s.find("div", class_="mw-parser-output")
    if not parser_output or not parser_output.ol:
        return

    for child in parser_output.ol.children:
        if isinstance(child, NavigableString):
            continue
        question = child.find("div", class_="ruling-question").text.strip()
        answer = child.find("div", class_="ruling-answer").text.strip()
        ruling.append([question, answer])

    res["ruling"] = ruling


def parse_page(id):
    res = {}
    req = urllib.request.Request(URL_BASE_DIGI + id, headers={'User-Agent': 'Mozilla/5.0'})
    try:
        f = urllib.request.urlopen(req)
    except:
        return None
    s = BeautifulSoup(f, 'lxml')

    parser_output = s.find("div", class_="page-content").find("div", class_="mw-parser-output")

    img_elem = parser_output.find("a", class_="image")
    if img_elem:
        res["image"] = img_elem.img["src"]

    parser_output_inner = parser_output.find("div", class_="ctable").div

    # Card Info
    res["id"] = id
    info_block = parser_output_inner.find("div", class_="info-main").table.tbody
    ilustrators = []
    for child in info_block.children:
        if isinstance(child, NavigableString) or len(child.contents) < 4:
            continue
        block_type = child.contents[1].text.strip()
        block_data = child.contents[3].text.strip()
        if block_type == "Name":
            res["name"] = block_data
        elif block_type == "Japanese":
            res["jpname"] = block_data
        elif block_type == "Translated":
            res["tsname"] = block_data
        elif block_type == "Colour":
            res["color"] = [s.strip() for s in block_data.split("/")]
        elif block_type == "Card Type":
            res["cardtype"] = block_data
        elif block_type == "Play Cost":
            res["playcost"] = block_data
        elif block_type == "Use Cost":
            res["playcost"] = block_data
        elif block_type == "DP":
            res["dp"] = block_data[0:-3]
        elif block_type == "Level":
            res["level"] = block_data
        elif block_type == "Form":
            res["form"] = block_data
        elif block_type == "Attribute":
            res["attribute"] = block_data
        elif block_type == "Type":
            res["type"] = block_data
        elif block_type == "Level":
            res["level"] = block_data
        elif block_type.startswith("Illustrator"):
            ilustrators.append(block_data)
    res["ilustrators"] = ilustrators


    # Digivolution requirements
    evo_index = 1
    info_block = parser_output_inner.find("div", class_="info-digivolve")
    for i in info_block.find_all("table", class_="evocon"):
        evo_index_str = str(evo_index)
        for child in i.tbody.find_all("tr"):
            if len(child.contents) < 4:
                continue
            block_type = child.contents[1].text.strip()
            block_data = child.contents[3].text.strip()
            if block_type == "Colour":
                res["evocolor" + evo_index_str] = block_data
            elif block_type == "Level":
                res["evolevel" + evo_index_str] = block_data
            elif block_type == "Digivolve Cost":
                res["evocost" + evo_index_str] = block_data
        evo_index += 1


    # Effect
    info_block = parser_output_inner.find("div", class_="info-extra").contents
    effect = info_block[1]
    if effect.name == "table":
        tmp = effect.tbody.contents[2]
        # Change <br> with \n
        for br in tmp.find_all("br"):
            br.replace_with("\n")
        res["effect1"] = tmp.text.strip()
    inherited_effect = info_block[3]
    if inherited_effect.name == "table":
        tmp = inherited_effect.tbody.contents[2]
        # Change <br> with \n
        for br in tmp.find_all("br"):
            br.replace_with("\n")
        res["effect2"] = tmp.text.strip()

    # Sets
    set_origins = []
    for i in parser_output.find_all("h3"):
        origin_id = i.span["id"].strip()
        if origin_id == "Worldwide_Sets":
            set_origins.append("wwsets")
        elif origin_id == "English_Sets":
            set_origins.append("engsets")
        else: # Japanese_Sets
            set_origins.append("jpsets")
    set_index = 0
    for i in parser_output.find_all("table", class_="settable"):
        set_origin = set_origins[set_index]
        set_index += 1
        res[set_origin] = []
        for j in i.tbody.find_all("tr")[1:]:
            set_elements = j.find_all("td")
            rarity = set_elements[2].text.strip()
            if not "rarity" in res and rarity != "Alternative Art":
                res["rarity"] = rarity
            res[set_origin].append(set_elements[1].text.strip())

    parse_rulings(id, res)
    return res


def wiki_get_data(set_index):
    res = []

    if set_index >= len(page_templates):
        print("The index is not available")
        return res

    page_template = page_templates[set_index]
    pack_name = series_name_list[set_index]

    page_index = 0
    while True:
        page_index += 1
        if page_index != 1:
            time.sleep(sleep_time)

        page_id = page_template.format(page_index)
        card_data = parse_page(page_id)
        if not card_data:
            break
        res.append(card_data)
        print(card_data["id"])
    return res


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

    for idx in booster_indices:
        idx = int(idx)
        page_template = page_templates[idx]
        # data for all the cards of a single series
        json_data = {}
        name = series_name_list[idx]
        json_data['name'] = name
        json_data['shortname'] = name[0:name.find(':', 1)]

        card_list = wiki_get_data(idx)
        json_data['cards'] = card_list

        file = open(json_data['shortname'] + ".json", "w")
        file.write(json.dumps(json_data, sort_keys=False, indent=4, ensure_ascii=False))
        file.close()


if __name__ == "__main__":
    main()
