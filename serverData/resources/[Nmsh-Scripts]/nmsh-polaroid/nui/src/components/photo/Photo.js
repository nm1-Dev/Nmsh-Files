
import React, {useState} from 'react'
import { useNuiEvent } from '../../hooks/useNuiEvents'
import { useStyles } from './index.styles'

export const Photo = () => {
    const classes = useStyles();
    const [OpenOther , setOpenOther] = useState(false)
    const [Image, setImage] = useState({img: 'https://cdn.discordapp.com/attachments/970480688946114600/973061111601594418/screenshot.jpg', date: '2020-01-01',msg : 'Hello'})

    useNuiEvent('showOther', (data) => {
        setOpenOther(true)
        setImage(data)
    })

    useNuiEvent('closePhotoApp', () => {
        setOpenOther(false)
        setImage('')
    })

    return (
        <>
            {OpenOther && 
                <div className={classes.wrapper}>
                    <div className={classes.image}>
                        <span className={classes.date2}>{Image.date}</span>
                        <div className={classes.marginPhoto} style={{backgroundImage: `URL(${Image.img})`}}>
                        </div>
                        <span className={classes.photoFontSize}>{Image.msg}</span> 
                    </div>
                </div>
            }
        </>
    )
}
