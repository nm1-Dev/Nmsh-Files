import { useState, useEffect } from 'react';
import { Album } from './components/album/Album';
import { Camera } from './components/camera/Camera';
import { Photo } from './components/photo/Photo';
import { fetchNui } from './hooks/fetchNui';

import './style.css';

function App() {
  const [language, setLanguage] = useState({
    prevPage: "PREV PAGE",
    nextPage: "NEXT PAGE",
    addDesc: "ADD DESCRIPTION",
    showToOthers: "SHOW TO OTHERS",
    giveToPlayer: "GIVE TO PLAYER",
    moveToInventory: "MOVE TO INVENTORY",
    submit: "SUBMIT",
    cancel: "CANCEL",
    delete: "DELETE",
    instruction1: "[E] to snap a photo!",
    instruction2: "Press [E] to take a photo!",
    instruction3: "[ESC] to exit!",
    instruction4: "How to use",
    FILTERS: [  //Just change the style
      {
        effect: 'close',
        style: '❌ Close'
      },
      {
        effect: 'removefilter',
        style: 'Remove Filter'
      },
      {
        effect: 'SPECIAL_NOIR',
        style: 'Special Noir',
      },
      {
        effect: 'NG_filmic01',
        style: 'Retro',
      },
      {
        effect: 'NG_filmic02',
        style: 'The 70s',
      },
      {
        effect: 'NG_filmic03',
        style: 'Retro Fuzzed',
      },
      {
        effect: 'NG_filmic04',
        style: 'Black and White',
      },
      {
        effect: 'CopsSPLASH',
        style: 'Blue Hue',
      },
      {
        effect: 'Damage',
        style: 'Red Vignette',
      },
      {
        effect: 'Dying',
        style: 'Desaturated',
      },
      {
        effect: 'Sniper',
        style: 'Fisheye',
      },
      {
        effect: 'traffic_skycam',
        style: 'Cold Vintage',
      },
      {
        effect: 'sunglasses',
        style: 'Sunset',
      },
      {
        effect: 'ufo_deathray',
        style: 'Bad Trip',
      },
      {
        effect: 'glasses_darkblue',
        style: 'Ocean',
      },
      {
        effect: 'Barry1_Stoned',
        style: 'Heatwave',
      },
      {
        effect: 'shades_yellow',
        style: 'Sepia',
      },
      {
        effect: 'player_transition_no_scanlines',
        style: 'Snowblind',
      },
      {
        effect: 'hud_def_desatcrunch',
        style: 'Noir',
      },
      {
        effect: 'drug_flying_base',
        style: 'Digital Vibrance',
      },
      {
        effect: 'drug_2_drive',
        style: 'Vintage Fisheye',
      },
      {
        effect: 'drug_drive_blend02',
        style: 'Pink Haze',
      },
    ]
  });


  useEffect(() => {
    fetchNui('row-polaroid:getLang').then((data) => {
        try {
            console.log('row-polaroid: Config Inited')
            setLanguage(data.language)
        } catch(error) {
            console.log(error)
        }
    })
}, [])

  return (
    <>
      <Camera langProvider={language} />
      <Album langProvider={language} />
      <Photo />
    </>
  );
}

export default App;
