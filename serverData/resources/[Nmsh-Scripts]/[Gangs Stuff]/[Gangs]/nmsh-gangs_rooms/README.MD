شكرا لك لشرائك السكربت


1 - ادخل qb-core/shred/items.lua
ركب هذا الايتم مع الصوره

    ["key1"] = {
        ["name"] = "key1",
        ["label"] = "Key 1",
        ["weight"] = 0,
        ["type"] = "item",
        ["unique"] = false,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["image"] = "nmsh_key1.png",
        ["description"] = "Hotel Key"
    },

2 - ادخل ملف qb-inventory/html/js/app.js
وابحث عن
itemData.name ==
وحط هذا الكود نفس كذا
https://prnt.sc/wl6Xf7PXGz-J

        } else if (itemData.name == "key1") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Room Number: #" + itemData.info.roomnumber + "</p>");

3 - عدل على ملف ال shared

4 - انسخ ملف mafiahotel.lua
وحطه هنا qb-doorlock/configs