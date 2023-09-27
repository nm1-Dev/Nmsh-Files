import React, { useState, useEffect, useRef } from 'react'
import { useStyles } from './index.styles'
import { useNuiEvent } from '../../hooks/useNuiEvents';
import { Slide, TextField, InputAdornment, Button, FormControl, Select, MenuItem, createTheme, ThemeProvider } from '@mui/material';
import { fetchNui } from '../../hooks/fetchNui';
import { Buttons } from '../components';
import HTMLFlipBook from 'react-pageflip';

export const isEnvBrowser = () => !(window).invokeNative

const darkTheme = createTheme({
    palette: {
        mode: 'dark',
        primary: {
            main: '#2980B9',
        },
    },
});


export const Album = ({langProvider}) => {
    const classes = useStyles();
    const ref = useRef()
    const BookRef = useRef()
    const width = window.innerWidth;
    const height = window.innerHeight;
    const WidthSize = width * 0.34;
    const HeightSize = height * 0.8;
    const [Binder, SetBinder] = useState(false || isEnvBrowser());
    const [OpenPhotos, setOpenPhotos] = useState(false);
    const [PhotoInfo, SetPhotoInfo] = useState({ img: '', msg: '' });
    const [Text, SetText] = useState('')
    const [BDescrition, SetBDescrition] = useState(false);
    const [Esxmode, setEsxmode] = useState(false);
    const [GiveOther, setGiveOther] = useState(false);
    const [players, setplayers] = useState('');
    const [Photos, SetPhotos] = useState([])
    const [Album, SetAlbum] = useState([]);

    useEffect(() => {
        const checkIfClickedOutside = (e) => {
            if (ref.current && !ref.current.contains(e.target)) {
                setOpenPhotos(false);
            }
        }

        document.addEventListener("mousedown", checkIfClickedOutside)

        return () => {
            document.removeEventListener("mousedown", checkIfClickedOutside)
        }
    }, [OpenPhotos, setOpenPhotos])

    useEffect(() => {
        function handleEscapeKey(event) {
            if (event.code === 'Escape' && Binder) {
                SetBinder(false);
                fetchNui('CloseAlbumPolaroid', {})
            }
        }

        document.addEventListener('keydown', handleEscapeKey)
        return () => document.removeEventListener('keydown', handleEscapeKey)
    }, [Binder, SetBinder])

    useNuiEvent('SetPhotos', (data) => {
        const tp = [data.photos]
        SetPhotos([...Photos, ...tp])
    })

    useNuiEvent('SpawnMSG', (data) => {
        SetPhotos([])
        setTimeout(() => {
            SetPhotos(data.photos)
        }, 1000)
    })

    useNuiEvent('OpenBinderPolaroid', () => {
        SetBinder(true)
    })

    useNuiEvent('ESXMODE', () => {
        setEsxmode(true)
    })

    const OpenPhoto = (information) => {
        SetPhotoInfo(information)
        setOpenPhotos(true)
    }

    const AddDesc = (id) => {
        setOpenPhotos(false);
        SetBDescrition(true);
    }

    const HandleCancel = () => {
        SetBDescrition(false);
        setGiveOther(false);
    }

    const HandleSubmit = (id) => {
        SetPhotos((Photos) => {
            const tasks = [...Photos];
            const indexOfTaskToDelete = tasks.findIndex(
                task => task.img === id.img
            );
            tasks.splice(indexOfTaskToDelete, 1);
            return [...tasks, ...[{ img: id.img, msg: Text, date: id.date }]]
        });
        setOpenPhotos(true);
        SetBDescrition(false);
        SetPhotoInfo({ img: id.img, msg: Text, date: id.date })
        fetchNui('UpdatePhoto', { data: { img: id.img, msg: Text, date: id.date } })
    }

    const handleChangeText = (e) => {
        SetText(e.target.value)
    }

    const SendToInventory = (id) => {
        fetchNui('SendToInventory', { PhotoInfo })
        SetPhotos((Photos) => {
            const tasks = [...Photos];
            const indexOfTaskToDelete = tasks.findIndex(
                task => task.img === id.img
            );
            tasks.splice(indexOfTaskToDelete, 1);
            return [...tasks]
        });
        SetPhotoInfo('')
        setOpenPhotos(false)
    }

    const DeletePhotoEsx = (id) => {
        fetchNui('row-polaroid:delete:esxphoto', { PhotoInfo })
        SetPhotos((Photos) => {
            const tasks = [...Photos];
            const indexOfTaskToDelete = tasks.findIndex(
                task => task.img === id.img
            );
            tasks.splice(indexOfTaskToDelete, 1);
            return [...tasks]
        });
        SetPhotoInfo('')
        setOpenPhotos(false)
    }

    const ShowToOther = (id) => {
        fetchNui('ShowToOthers', { id })
        SetBinder(false);
        fetchNui('CloseAlbumPolaroid', {})
    }

    const GivePolaroidOthers = (id) => {
        fetchNui('GetPlayers', {
        }).then((resp) => {
            if (resp.players) {
                console.log(resp.players)
                setplayers(resp.players);
                setGiveOther(true);
                setOpenPhotos(false);
            } else {
                setplayers('No players found')
            }
        });
    }

    const HandleSubmitESX = (id) => {
        SetPhotos((Photos) => {
            const tasks = [...Photos];
            const indexOfTaskToDelete = tasks.findIndex(
                task => task.img === id.img
            );
            tasks.splice(indexOfTaskToDelete, 1);
            return [...tasks]
        });
        setOpenPhotos(false);
        SetBDescrition(false);
        setGiveOther(false);
        fetchNui('SendToClient', { data: { img: id.img, msg: id.msg, date: id.date, id: Text } })
    }


    useEffect(() => {
        const lastArr = Photos
        const newArra = []
        for (let i = 0; i < lastArr.length; i += 4) {
            let pedazo = lastArr.slice(i, i + 4);
            newArra.push({ part: pedazo });
        }
        SetAlbum(newArra)
    }, [Photos])


    const NeedPrevPageButton = (number) => {
        if (number % 2 === 0) {
            return false
        } else {
            return true
        }
    }


    return (
        <Slide direction="up" in={Binder} mountOnEnter unmountOnExit>
            <div className={classes.wrapper}>
                <div className={classes.albumWrapper}>
                    <div className={classes.drawline} />
                    <div className={classes.album}>
                        <HTMLFlipBook
                            width={WidthSize}
                            height={HeightSize}
                            showCover={true}
                            clickEventForward={false}
                            useMouseEvents={false}
                            drawShadow={false}
                            ref={BookRef}
                        >
                            {Album.map((id, index) => (
                                <div className={classes.comicPage}>
                                    <div className={classes.comicPageWrapper}>
                                        {id.part.map((data, index) => (
                                            <div className={`${Math.random() > 0.5 ? classes.photo : classes.photo2}`} key={index}>
                                                <span className={classes.date}>{data.date}</span>
                                                <div className={classes.realPhoto}>
                                                    <div className={classes.photoWrapper} style={{ backgroundImage: `URL(${data.img})` }} onClick={() => { OpenPhoto(data) }}>
                                                    </div>
                                                    <span className={classes.photoFont}>{data.msg}</span>
                                                </div>
                                            </div>
                                        ))}
                                        <div className={classes.centerButtons}>
                                            {NeedPrevPageButton(index) && <div className={classes.centerButtonsAbs}>
                                                <Button variant="contained"
                                                    onClick={() => { BookRef.current.pageFlip().flipPrev() }}
                                                    size="small"
                                                    sx={{ width: 'auto', height: '30px', bgcolor: '#eaa56e', color: 'black', margin: '10px 60% 10px 10px', pointerEvents: 'all', ':hover': { bgcolor: '#986c49' } }} >
                                                    {langProvider.prevPage}
                                                </Button>
                                            </div>}
                                            {!NeedPrevPageButton(index) &&
                                                <>
                                                    <div className={classes.centerButtonsAbs}>
                                                        <ThemeProvider theme={darkTheme}>
                                                            <FormControl variant="standard" sx={{ m: 1, width: '33%', pointerEvents: 'all' }}>
                                                                <Select
                                                                    labelId="demo-simple-select-standard-label"
                                                                    id="demo-simple-select-standard"
                                                                    // value={value}
                                                                    onChange={(e) => BookRef.current.pageFlip().turnToPage(e.target.value)}
                                                                >
                                                                    {Album?.map((data, index) => (
                                                                        <MenuItem value={index} key={index}>{`Página ${index + 1}`}</MenuItem>
                                                                    ))}
                                                                </Select>
                                                            </FormControl>
                                                        </ThemeProvider>
                                                    </div>
                                                    <div className={classes.centerButtonsAbs}>
                                                        <Button variant="contained"
                                                            onClick={() => { BookRef.current.pageFlip().flipNext() }}
                                                            size="small"
                                                            sx={{ width: 'auto', height: '30px', bgcolor: '#eaa56e', color: 'black', margin: '10px 10px 10px 60%', pointerEvents: 'all', ':hover': { bgcolor: '#986c49' } }} >
                                                            {langProvider.nextPage}
                                                        </Button>
                                                    </div>
                                                </>

                                            }
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </HTMLFlipBook>
                    </div>
                </div>
                {OpenPhotos &&
                    <div className={classes.openPhoto} ref={ref}>
                        <span className={classes.date2}>{PhotoInfo.date}</span>
                        <div className={classes.marginPhoto} style={{ backgroundImage: `URL(${PhotoInfo.img})` }}>
                        </div>
                        {PhotoInfo.msg ?
                            <span className={classes.photoFontSize}>{PhotoInfo.msg}</span>
                            :
                            <>
                                <div className={classes.btnBottom}>
                                    <Buttons variant={2} text={langProvider.addDesc} icon={'fas fa-pen-clip'} style={{ top: '-10px' }} onClick={() => { AddDesc(PhotoInfo) }} />
                                </div>
                            </>
                        }
                        <div className={classes.buttons}>
                            <Buttons variant={1} text={langProvider.showToOthers} icon={'fas fa-share'} onClick={() => { ShowToOther(PhotoInfo) }} />
                            {Esxmode ?
                                <>

                                    <Buttons variant={2} text={langProvider.giveToPlayer} icon={'fas fa-box-archive'} onClick={() => { GivePolaroidOthers(PhotoInfo) }} />
                                    <Button variant="contained"
                                        onClick={() => { DeletePhotoEsx(PhotoInfo) }}
                                        sx={{ width: 'auto', height: '30px', bgcolor: '#FF0000', color: 'white', marginLeft: '10px', borderRadius: '15px', ':hover': { bgcolor: '#606060' } }}>
                                        <i className={"fa-solid fa-trash"} style={{ color: "white", margin: '3px' }}></i>
                                        {langProvider.delete}
                                    </Button>
                                </>
                                :
                                <Buttons variant={2} text={langProvider.moveToInventory} icon={'fas fa-box-archive'} onClick={() => { SendToInventory(PhotoInfo) }} />
                            }
                        </div>
                    </div>
                }

                {BDescrition &&
                    <div className={classes.Screen}>
                        <div className={classes.SuperInput}>
                            <div className={classes.SuperInputFix}>
                                <TextField
                                    id="input-with-icon-textfield"
                                    label={"Write your beautiful message"}
                                    classes={classes}
                                    onChange={handleChangeText}
                                    InputLabelProps={{ style: { color: 'white' } }}
                                    autoComplete="off"
                                    InputProps={{
                                        startAdornment: (
                                            <InputAdornment position="start">
                                                <i className={'fas fa-pen-clip'} style={{ color: "white", margin: '3px' }}></i>
                                            </InputAdornment>
                                        ),
                                    }}
                                    variant="standard"
                                />
                            </div>
                            <div className={classes.SuperBtnFix}>
                                <Buttons variant={1} text={langProvider.submit} icon={'fas fa-share'} onClick={() => { HandleSubmit(PhotoInfo) }} />
                                <Buttons variant={2} text={langProvider.cancel} icon={'fas fa-xmark'} onClick={HandleCancel} />
                            </div>
                        </div>
                    </div>
                }

                {GiveOther &&
                    <div className={classes.Screen}>
                        <div className={classes.SuperInput}>
                            <div className={classes.SuperInputFix}>
                                <TextField
                                    id="input-with-icon-textfield"
                                    label={"Players near : " + players}
                                    classes={classes}
                                    onChange={handleChangeText}
                                    InputLabelProps={{ style: { color: 'white' } }}
                                    autoComplete="off"
                                    InputProps={{
                                        startAdornment: (
                                            <InputAdornment position="start">
                                                <i className={'fas fa-pen-clip'} style={{ color: "white", margin: '3px' }}></i>
                                            </InputAdornment>
                                        ),
                                    }}
                                    variant="standard"
                                />
                            </div>
                            <div className={classes.SuperBtnFix}>
                                <Buttons variant={1} text={langProvider.submit} icon={'fas fa-share'} onClick={() => { HandleSubmitESX(PhotoInfo) }} />
                                <Buttons variant={2} text={langProvider.cancel} icon={'fas fa-xmark'} onClick={HandleCancel} />
                            </div>
                        </div>
                    </div>

                }
            </div>
        </Slide>
    )
}
