var level = 1,
    xp = 0,
    neededEXP = 1000;

var hedef = 2;
var selectedPrice = 1000;
var upgradePriceRod = [];
var first = false;
var fishData = [];
var sellMenuData = [];
var gameActive = false;

window.addEventListener("message", (event) => {
    if (event.data.type === "openUiFirst") {
        $(".generalFishMenu").show();
        giveExp(event.data.userDetails.currentXP);
        setTaskItems(event.data.tasks, event.data.userDetails);
        setMiddleItems(event.data.fishes);
        fishData = event.data.fishes;
        sellMenuData = event.data.sellMenu;
    } else if (event.data.type === "openUi") {
        $(".title").html(event.data.customize.title);
        $(".middleText").html(event.data.customize.fishAreaTitle);
        $(".rightText").html(event.data.customize.taskAreaTitle);
        $("#currentText").html(event.data.customize.currentXP);
        $("#requiredText").html(event.data.customize.requiredXP);
        neededEXP = event.data.levelReq;
        setTaskItems(event.data.tasks, event.data.userDetails);
        setMiddleItems(event.data.fishes);
        $(".generalFishMenu").show();
        // giveExp(event.data.userDetails.currentXP);
    } else if (event.data.type === "updateXP") {
        giveExp(event.data.amount);
    } else if (event.data.type === "setJS") {
        neededEXP = event.data.levelReq;
        upgradePriceRod = event.data.upgradeRodPrices;
        $(".title").html(event.data.customize.title);
        $(".middleText").html(event.data.customize.fishAreaTitle);
        $(".rightText").html(event.data.customize.taskAreaTitle);
        $("#currentText").html(event.data.customize.currentXP);
        $("#requiredText").html(event.data.customize.requiredXP);
        if (!first) {
            first = true;
            selectedPrice = upgradePriceRod[0];
            $(".priceUpgrade").html("$" + selectedPrice);
        }
    } else if (event.data.type === "openUpgradeUi") {
        $(".title").html(event.data.customize.title);
        $(".middleText").html(event.data.customize.fishAreaTitle);
        $(".rightText").html(event.data.customize.taskAreaTitle);
        $("#currentText").html(event.data.customize.currentXP);
        $("#requiredText").html(event.data.customize.requiredXP);
        upgradePriceRod = event.data.upgradeRodPrices;
        if (!first) {
            first = true;
            selectedPrice = upgradePriceRod[0];
            $(".priceUpgrade").html("$" + selectedPrice);
        }
        $(".upgradeRod").show();
    } else if (event.data.type === "openMarketUi") {
        $(".title").html(event.data.customize.title);
        $(".middleText").html(event.data.customize.fishAreaTitle);
        $(".rightText").html(event.data.customize.taskAreaTitle);
        $("#currentText").html(event.data.customize.currentXP);
        $("#requiredText").html(event.data.customize.requiredXP);
        fishData = event.data.fishes;
        sellMenuData = event.data.sellMenu;
        setBuyMarketItems(event.data.buyMarketItems);
        $(".sellItemCharName").html(event.data.fullName);
        $(".marketSelectMenu").show();
    } else if (event.data.type === "openMarketUiFirst") {
        $(".title").html(event.data.customize.title);
        $(".middleText").html(event.data.customize.fishAreaTitle);
        $(".rightText").html(event.data.customize.taskAreaTitle);
        $("#currentText").html(event.data.customize.currentXP);
        $("#requiredText").html(event.data.customize.requiredXP);
        $(".sellItemCharName").html(event.data.fullName);
        giveExp(event.data.userDetails.currentXP);
        setTaskItems(event.data.tasks, event.data.userDetails);
        setBuyMarketItems(event.data.buyMarketItems);
        fishData = event.data.fishes;
        sellMenuData = event.data.sellMenu;
        $(".marketSelectMenu").show();
    } else if (event.data.type === "startGame") {
        keyGameStart();
    } else if (event.data.type === "stopGame") {
        if (gameActive) {
            keyGameStop();
        }
    } else if (event.data.type === "fishing") {
        if (event.data.state) {
            $(".baitText").show();
        } else {
            $(".baitText").hide();
        }
    } else if (event.data.type === "setBait") {
        if (event.data.bait !== "none") {
            $(".currentBaitName").show();
            $(".currentBaitName").html(event.data.bait);
        } else {
            $(".currentBaitName").hide();
        }
    }
});

function updatecounters() {
    if (xp >= neededEXP) {
        level += Math.floor(xp / neededEXP);
        xp = xp % neededEXP;
    }
    $(".levelFill").css("width", (xp / neededEXP) * 100 + "%");
    document.getElementById("currentXpBottom").innerHTML = xp + " XP";
    document.getElementById("currentRequiredBottom").innerHTML = neededEXP + " XP";
    document.getElementById("currentLevelBottom").innerHTML = level + " Lv.";
}

function giveExp(number) {
    xp += number;
    updatecounters();
}

$(document).on("keydown", function () {
    switch (event.keyCode) {
        case 27: // ESC
            $.post("https://nmsh-advancedFishing/closeMenu", JSON.stringify());
            $(".generalFishMenu").hide();
            $(".upgradeRod").hide();
            $(".marketSelectMenu").hide();
            $(".classMarketSection").hide();
            $(".classSellItemSection").hide();
            if (gameActive) {
                keyGameStop();
                $.post("https://nmsh-advancedFishing/failGame", JSON.stringify());
            }
            break;
    }
});

function setMiddleItems(data) {
    $(".inMiddle").empty();
    var recentEvent = $(".inMiddle").html();
    for (let i = 0; i < data.length; i++) {
        const element = data[i];
        if (element.onFishMenu) {
            var CCState = level >= element.requiredLevel ? "can be caught" : "cannot be caught";
            var CCStateID = level >= element.requiredLevel ? "Tutulabilir" : "Tutulamaz";
            var type = element.fishType == "Illegal" ? "illegalType" : "legal";
            recentEvent =
                recentEvent +
                `
                <div class="middleItem">
                <div class="canCatchSection" id="${CCStateID}"> ${CCState} </div>
                    <div class="middleItemImgSection">
                        <img src=${element.image} alt="" />
                    </div>
                    <div class="middleItemName">
                        <span id="middleFishName">${element.fishName}</span>
                        <p id="middleFishRequiredLevel">${element.requiredLevel} lvl</p>
                    </div>
                    <div class="middleItemDescs" id="middleFishDesc">
                    ${element.description}
                    </div>
                    <div class="middleItemRequired">
                        <div class="middleItemTypeSection">
                            <div class="middleItemType" id="middleFishType">Type:</div>
                            <div class="middleItemTypeName" id="${type}">${element.fishType}</div>
                        </div>
                        <div class="middleItemRequiredRod">
                            <div class="middleItemRequiredRodType" id="middleFishingRodReq">Fishing Rod Lv:</div>
                            <div class="middleItemRequiredRodLevel" id="middleFishingRodLv">${element.requiredRodLvl}</div>
                        </div>
                    </div>
                </div>
                `;
        }
    }
    $(".inMiddle").html(recentEvent);
}

function setBuyMarketItems(data) {
    $(".marketMiddle").empty();
    var recentEvent = $(".marketMiddle").html();
    for (let i = 0; i < data.length; i++) {
        const element = data[i];
        recentEvent =
            recentEvent +
            `
            <div class="marketMidItem">
                <div class="marketImgSection">
                    <span class="marketPriceItem">$${element.itemPrice}</span>
                    <span class="marketItemName">${element.itemLabel}</span>
                    <img src= ${element.image} alt="" />
                </div>
                <div class="inItemBottom">
                    <input class="countArea" id="count-${element.itemId}" type="text" value="1" min="0" max="999" onblur="if(this.value == '') { this.value='1'}" onfocus="if (this.value == '1') {this.value=''}" maxlength="9999" />
                    <div class="marketBuyButton" data-itemId="${element.itemId}" data-itemName="${element.itemName}" data-itemPrice="${element.itemPrice}">
                        <span class="material-icons" id="buyIconMarket"> local_grocery_store </span>
                    </div>
                </div>
            </div>
            `;
    }
    $(".marketMiddle").html(recentEvent);
}

$(document).on("click", ".sellItemSellButton", function () {
    let itemId = $(this).attr("data-itemId");
    let itemCount = $("#buyCount-" + itemId).val();
    if (itemCount > 0) {
        $.post(
            "https://nmsh-advancedFishing/sellItem",
            JSON.stringify({
                itemId: itemId,
                itemCount: itemCount,
            }),
            function (data) {
                if (data) {
                }
            }
        );
    }
});

function setSellMenuItems(data) {
    $(".sellItemMiddle").empty();
    var recentEvent = $(".sellItemMiddle").html();
    for (let i = 0; i < data.length; i++) {
        const element = data[i];

        if (level >= element.requiredLevel) {
            recentEvent =
                recentEvent +
                `
                    <div class="sellmiddleItem">
                        <div class="sellItemImageSec">
                            <div class="itemImageTopSec">
                                <div class="sellItemPrice">$${element.fishPrice}</div>
                                <div class="sellItemLevel">${element.requiredLevel} Lv.</div>
                            </div>
                            <img src=${element.shopImage} alt="" />
                        </div>
                        <div class="sellItemName">${element.fishName}</div>
                        <div class="sellItemBottom">
                            <input type="text" id="buyCount-${element.id}" class="sellItemCount" value="1" />
                            <div class="sellItemSellButton" data-itemId="${element.id}" data-itemName="${element.itemName}" data-itemPrice="${element.fishPrice}"  >
                                <span class="material-icons" id="sellItemSellIcon"> sell </span>
                            </div>
                        </div>
                    </div>
                    `;
        } else {
            recentEvent =
                recentEvent +
                `
                    <div class="sellmiddleItem">
                        <div class="sellItemImageSec">
                            <div class="itemImageTopSec">
                                <div class="sellItemPrice">$${element.fishPrice}</div>
                                <div class="sellItemLevel">${element.requiredLevel} Lv.</div>
                            </div>
                            <img src=${element.shopImage} alt="" />
                        </div>
                        <div class="sellItemName">${element.fishName}</div>
                        <div class="sellItemBottom">
                            <div class="sellItemCannotSell">Insufficient Level</div>
                        </div>
                    </div>
                    `;
        }
    }

    $(".sellItemMiddle").html(recentEvent);
}

function setCanSellMenuItems(data) {
    $(".canSellItemAreaS").empty();
    var recentEvent = $(".canSellItemAreaS").html();
    for (let i = 0; i < data.length; i++) {
        const element = data[i];
        if (level >= element.requiredLevel) {
            recentEvent =
                recentEvent +
                `
                    <div class="canSellFishItem">${element.fishName}</div>
                `;
        }
    }
    $(".canSellItemAreaS").html(recentEvent);
}

function setTaskItems(data, userDetails) {
    $(".rightArea").empty();
    var recentEvent = $(".rightArea").html();
    for (let i = 0; i < data.length; i++) {
        const element = data[i];
        var userDetailss = JSON.parse(userDetails.tasks);
        if (typeof userDetailss[i] !== "undefined") {
            if (!userDetailss[i].taken && userDetailss[i].hasCount < element.requiredCount) {
                recentEvent =
                    recentEvent +
                    `
                            <div class="rightItem" data-taskId="${element.taskId}">
                                <div class="rightItemTaskName">
                                    <span> ${element.taskName} </span>                                  
                                </div>
                                <div class="rightItemDescription">
                                    ${element.taskDescription}
                                </div>
                                <div class="rightItemBottomSec">
                                    <p class="rightItemRewardsCash">+ ${element.moneyRewards}$</p>
                                    <div class="righItemRewardXP">+ ${element.xpRewards}XP</div>
                                </div>
                                <div class="rightRequiredText">
                                    <div class="rightItemRequired">${element.requiredCount}</div>
                                    <span class="slashRight">/</span>
                                    <div class="rightItemCurrent">${userDetailss[i].hasCount}</div>
                                </div>
                                <div class="rightItemLevelSection">
                                    <div class="rightItemLevelFill" style="width:${(userDetailss[i].hasCount / element.requiredCount) * 100}%"></div>
                                </div>
                            </div>
                            `;
            } else {
                if (!userDetailss[i].taken) {
                    recentEvent =
                        recentEvent +
                        `
                                <div class="rightItem takeRewards" id="takeRewards-${i}" data-taskId="${element.taskId}" data-moneyRewards="${
                            element.moneyRewards
                        }" data-xpRewards="${element.xpRewards}" data-taskName="${element.taskName}">
                                    <div class="rightItemTaskName">
                                        <span> ${element.taskName} </span>
                                    </div>
                                    <div class="rightItemTakeRewards">
                                        Receive Award!
                                    </div>
                                    <div class="rightItemBottomSec">
                                        <p class="rightItemRewardsCash">+ ${element.moneyRewards}$</p>
                                        <div class="righItemRewardXP">+ ${element.xpRewards}XP</div>
                                    </div>
                                    <div class="rightRequiredText">
                                        <div class="rightItemRequired">Completed</div>
                                    </div>
                                    <div class="rightItemLevelSection">
                                        <div class="rightItemLevelFill" style="width:${
                                            (userDetailss[i].hasCount / element.requiredCount) * 100
                                        }%"></div>
                                    </div>
                                </div>
                                `;
                } else {
                    recentEvent =
                        recentEvent +
                        `
                                <div class="rightItem takenRew">
                                    <div class="rightItemTaskName">
                                        <span> ${element.taskName} </span>
                                    </div>
                                    <div class="rightItemTaken">
                                        Award Received!
                                    </div>
                                    <div class="rightItemBottomSec">
                                        <p class="rightItemRewardsCash">+ ${element.moneyRewards}$</p>
                                        <div class="righItemRewardXP">+ ${element.xpRewards}XP</div>
                                    </div>
                                    <div class="rightRequiredText">
                                        <div class="rightItemRequired">Completed</div>
                                    </div>
                                    <div class="rightItemLevelSection">
                                        <div class="rightItemLevelFill" style="width:100%"></div>
                                    </div>
                                </div>
                                `;
                }
            }
        } else {
            recentEvent =
                recentEvent +
                `
                <div class="rightItem takenRew">
                    <div class="rightItemTaskName">
                        <span> </span>
                        <p> </p>
                    </div>
                    <div class="rightItemTaken">
                        Loading problem check db
                    </div>
                    <div class="rightRequiredText">
                        <div class="rightItemRequired"></div>
                    </div>
                    <div class="rightItemLevelSection">
                        <div class="rightItemLevelFill" style="width:0%"></div>
                    </div>
                </div>
                `;
        }
    }
    $(".rightArea").html(recentEvent);
}

$(document).on("click", ".rightItem.takeRewards", function () {
    let taskId = $(this).attr("data-taskId");
    let moneyRewards = $(this).attr("data-moneyRewards");
    let xpRewards = $(this).attr("data-xpRewards");
    let taskName = $(this).attr("data-taskName");
    let elem = $(this);
    if (elem.hasClass("takeRewards")) {
        elem.removeClass("takeRewards");
    }
    let divId = this.id;
    $.post(
        "https://nmsh-advancedFishing/takeRewards",
        JSON.stringify({
            taskId: taskId,
            money: moneyRewards,
            xp: xpRewards,
        }),
        function (data) {
            if (data) {
                $("#" + divId).html(`
                    <div class="rightItemTaskName">
                    <span> ${taskName} </span>
                    </div>
                    <div class="rightItemTaken">
                        Award Received!
                    </div>
                    <div class="rightItemBottomSec">
                        <p class="rightItemRewardsCash">+ ${moneyRewards}$</p>
                        <div class="righItemRewardXP">+ ${xpRewards}XP</div>
                    </div>
                    <div class="rightRequiredText">
                        <div class="rightItemRequired">Completed</div>
                    </div>
                    <div class="rightItemLevelSection">
                        <div class="rightItemLevelFill" style="width:100%"></div>
                    </div>            
                `);
            }
        }
    );
});

$(document).on("click", ".cancelRodButton", function () {
    $.post("https://nmsh-advancedFishing/closeMenu", JSON.stringify());
    $(".upgradeRod").hide();
});

document.addEventListener("paste", cutCopyHandler);
document.addEventListener("keypress", keyPressFunc);

function keyPressFunc(e) {
    if (isNaN(String.fromCharCode(e.which))) {
        e.preventDefault();
    }
}

function cutCopyHandler(e) {
    e.preventDefault();
}

$(document).on("click", ".infoButton", function () {
    $(".mainMenuApp").hide();
    $(".infoButton").hide();
    $(".infoMenuApp").show();
    $(".backButtonMain").show();
});

$(document).on("click", ".backButtonMain", function () {
    $(".mainMenuApp").show();
    $(".infoButton").show();
    $(".infoMenuApp").hide();
    $(".backButtonMain").hide();
});

$(document).on("click", "#buyMenuOpen", function () {
    $(".marketSelectMenu").hide();
    $(".classMarketSection").show();
});

$(document).on("click", "#sellMenuOpen", function () {
    $(".sellItemCircle").html(level + " Lv.");
    setSellMenuItems(sellMenuData);
    setCanSellMenuItems(sellMenuData);
    $(".marketSelectMenu").hide();
    $(".classSellItemSection").show();
});

$(document).on("click", ".marketBuyButton", function () {
    let itemId = $(this).attr("data-itemId");
    let itemCount = $("#count-" + itemId).val();
    if (itemCount > 0) {
        $.post(
            "https://nmsh-advancedFishing/buyItem",
            JSON.stringify({
                itemId: itemId,
                itemCount: itemCount,
            }),
            function (data) {
                if (data) {
                }
            }
        );
    }
});

$(document).on("click", "#marketCloseButon", function () {
    $.post("https://nmsh-advancedFishing/closeMenu", JSON.stringify());
    $(".classMarketSection").hide();
});

$(document).on("click", "#sellCloseButon", function () {
    $.post("https://nmsh-advancedFishing/closeMenu", JSON.stringify());
    $(".classSellItemSection").hide();
});

$(document).on("click", ".upTopItem", function () {
    hedef = this.id;
    selectedPrice = upgradePriceRod[hedef - 2];
    $(".priceUpgrade").html("$" + upgradePriceRod[hedef - 2]);
    $("#hedefRodLv").html(hedef + " Lv.");
    $("#currentRodLv").html(hedef - 1 + " Lv.");
});

$(document).on("click", ".upgradeRodButton", function () {
    $.post(
        "https://nmsh-advancedFishing/upgradeRod",
        JSON.stringify({
            hedef: hedef,
            price: selectedPrice,
        }),
        function (data) {
            if (data) {
                $.post("https://nmsh-advancedFishing/closeMenu", JSON.stringify());
                $(".upgradeRod").hide();
            }
        }
    );
});

// ! KEY PRESS GAME

const FPS = 60;

let missedCount = 0;
let correctCount = 0;
let ekranda = 0;

const keys = [];
const validKeys = "abcdefghjklmnpqrstuvwyz123456789";
const randomLetter = () => validKeys.charAt(Math.floor(Math.random() * validKeys.length));

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

class Key {
    constructor(key) {
        if (ekranda < 5) {
            ekranda += 1;
            const node = document.createElement("div");
            node.className = "key";
            node.innerText = key;
            node.style.top = "-50px";
            node.style.left = getRandomInt(10, window.innerWidth - 50) + "px";
            this.y = -50;
            document.getElementById("tuslar").appendChild(node);
            this.node = node;
            this.key = key.toLowerCase();
            this.velocity = getRandomInt(2, 4);
            keys.push(this);
        }
    }
    delete() {
        this.node.remove();
        keys.splice(keys.indexOf(this), 1);
    }
}

const keyInterval = [300, 2000];
function addRandomKey() {
    const key = new Key(randomLetter().toUpperCase());

    randomKey = setTimeout(addRandomKey, getRandomInt(...keyInterval));
}

function hitKey(key) {
    key.node.className = "hit-key";
    keys.splice(keys.indexOf(key), 1);
    setTimeout(() => {
        key.node.remove();
    }, 600);
}

function update() {
    keys.forEach((key) => {
        key.y += key.velocity;
        key.node.style.top = key.y + "px";
        if (key.y > window.innerHeight) {
            key.delete();
            missedCount++;
            if (gameActive) {
                keyGameStop();
                $.post("https://nmsh-advancedFishing/failGame", JSON.stringify());
            }
        }
    });
    updateInterval = setTimeout(update, 1000 / FPS);
}

document.onkeyup = ({ key }) => {
    if (keys.some((keyObj) => keyObj.key === key)) {
        const foundKey = keys.find((keyObj) => keyObj.key === key);
        hitKey(foundKey);
        correctCount++;
        if (correctCount >= 5) {
            if (gameActive) {
                gameActive = false;
                clearTimeout(randomKey);
                clearTimeout(updateInterval);
                setTimeout(() => {
                    keyGameStop();
                    $.post("https://nmsh-advancedFishing/successGame", JSON.stringify());
                }, 150);
            }
        }
    } else {
        if (gameActive) {
            keyGameStop();
            $.post("https://nmsh-advancedFishing/failGame", JSON.stringify());
        }

        missedCount++;
    }
};

function keyGameStart() {
    gameActive = true;
    addRandomKey();
    update();
    $("#tuslar").show();
}

function keyGameStop() {
    $.post("https://nmsh-advancedFishing/closeMenu", JSON.stringify());
    gameActive = false;
    clearTimeout(randomKey);
    clearTimeout(updateInterval);
    keys.splice(0, keys.length);
    $("#tuslar").hide();
    $("#tuslar").empty();
    missedCount = 0;
    correctCount = 0;
    ekranda = 0;
}

// keyGameStart();
