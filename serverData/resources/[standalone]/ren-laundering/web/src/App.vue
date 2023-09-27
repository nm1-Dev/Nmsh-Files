<script>
import Nui from './nui'
export default {
    data() {
        return {
            Display: false,
            LaunderingAmount: 0,
            MoneyToLaunderAmount: 0,          
        }
    },
    methods: {
        FastPick(Amount) {
            this.LaunderingAmount = Amount
        },
        LaunderMoney() {
            Nui('LaunderMoney', this.LaunderingAmount)
            this.Display = false
            this.LaunderingAmount = 0
            this.MoneyToLaunderAmount = 0
        },
    },
    mounted() {
        window.addEventListener('message', (event) => {
            const data = event.data
            switch (data.type) {
            case 'open':
                this.Display = true
                this.MoneyToLaunderAmount = data.MoneyAmount
                break;       
            }
        })
        window.addEventListener("keydown", (key) => {
            if (key.code == "Escape") {
                this.Display = false
                this.LaunderingAmount = 0
                this.MoneyToLaunderAmount = 0
                Nui('CloseMenu')
            }
        });
    },
}
</script>

<template>   
    <div class="background" v-if="Display">
        <div class="title">
            <span class="t-wash">WASH</span>
            <span class="t-money">MONEY</span>
        </div>

        <div class="information>">
            <span class="t-enter">ENTER</span>
            <span class="t-atw">AMOUNT TO WASH</span>
            <span class="t-atW-transparent">AMOUNT TO WASH</span>
        </div>

        <div class="amount">
            <input v-model="LaunderingAmount" type="number" placeholder="0" />
        </div>

        <div class="fastpick">
            <div class="fp-100" @click="FastPick(100)">100 $</div>
            <div class="fp-10000" @click="FastPick(1000)">10000 $</div>
            <div class="fp-100000" @click="FastPick(10000)">100000 $</div>
        </div>

        <div class="washcash">
            <span class="b-washcash" @click="LaunderMoney()">Wash Cash</span>
        </div>

        <div class="budget">
            <div class="b-text1">YOUR BUDGET </div>
            <div class="b-money">{{ MoneyToLaunderAmount }} $</div>
            <div class="b-text2"> BLACK MONEY</div>
        </div>
    </div>   
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Kanit&display=swap');

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	border: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	user-select: none;
	-webkit-user-drag: none;
    -khtml-user-drag: none;
    -moz-user-drag: none;
    -o-user-drag: none;
    font-family: 'Kanit', sans-serif;
}

.background {
	position: absolute;
	width: 100vw;
	height: 100vh;
	background: linear-gradient(6deg, rgba(23, 179, 132, 0.617) 33%, rgba(23,179,169,0) 100%);
	overflow: hidden;
}

.t-wash {
    display: flex;
    justify-content: center;
    margin-top: 8vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 900;
    color: rgba(255, 255, 255, 0.152);
    font-size: 10vh;
}

.t-money {
    display: flex;
    justify-content: center;
    margin-top: -10vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 900;
    color: rgba(255, 255, 255, 0);
    font-size: 4vh;
    -webkit-text-stroke: 0.08vh white;
}

.t-enter {
    display: flex;
    justify-content: center;
    margin-top: 15vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 900;
    color: rgb(255, 255, 255);
    font-size: 5vh;
}

.t-atw {
    display: flex;
    justify-content: center;
    margin-top: -3vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 400;
    color: rgb(255, 255, 255);
    font-size: 3vh;
}

.t-atW-transparent {
    display: flex;
    justify-content: center;
    margin-top: -6.8vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 400;
    color: rgba(255, 255, 255, 0);
    font-size: 4.5vh;
    -webkit-text-stroke: 0.1vh rgba(255, 255, 255, 0.35);
}

.amount {
    display: flex;
    justify-content: center;
    margin-top: 3vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 400;
}

input {
    align-items: justify;
    line-height: 4.5vh;
    -moz-text-align-last: center; /* Firefox 12+ */
    text-align-last: center;
    resize: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    width: 15vh;
    text-align: center;
    height: 5vh;
    border: none;
    border-radius: 2vh;
    background-color:rgba(255, 255, 255, 0.117);
    outline: 0.2vh solid rgba(255, 255, 255, 0.562);
    outline-offset: 0.3vh;
    color: white;
    font-family: 'Kanit', sans-serif;
    font-weight: 400;
}

.fastpick {
    display: flex;
    justify-content: center;
    margin-top: 3vh;
    flex-direction: row;
    font-family: 'Kanit', sans-serif;
    font-weight: 500;
    color: white;
    gap: 1vh;
}

.fp-100 {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 10vh;
    height: 3vh;
    cursor: pointer;
    border-radius: 2vh;
    background-color:rgba(255, 255, 255, 0.117);
}

.fp-10000 {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 10vh;
    height: 3vh;
    cursor: pointer;
    border-radius: 2vh;
    background-color:rgba(255, 255, 255, 0.117);
}

.fp-100000 {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 10vh;
    height: 3vh;
    cursor: pointer;
    border-radius: 2vh;
    background-color:rgba(255, 255, 255, 0.117);
}

.fp-100:hover{
    background-color: #ffffff;
    color: black;
}

.fp-10000:hover{
    background-color: #ffffff;
    color: black;
}

.fp-100000:hover{
    background-color: #ffffff;
    color: black;
}

.washcash {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 8vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 400;
    flex-direction:column;
}

.b-washcash {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 15vh;
    height: 4vh;
    cursor: pointer;
    border-radius: 2vh;
    background-color:rgba(255, 255, 255, 0.117);
    color: #ffffff;
}

.b-washcash:hover{
    background-color: #ffffff;
    color: black;
}

.budget {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 23vh;
    font-family: 'Kanit', sans-serif;
    font-weight: 400;
    flex-direction: row;
    color: #ffffff;
    font-size: 2vh;
    gap: 1vh;
}

.b-money {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 15vh;
    height: 5vh;
    border-radius: 2vh;
    background-color:rgb(255, 255, 255);
    color: #000000;
    font-weight: 1000;
    font-size: 2vh;
}
</style>
