import { makeStyles } from '@mui/styles';

export const useStyles = makeStyles({
    wrapper: {
        top: '0px',
        left: '0px',
        width: '100vh',
        height: '100vh',
        position: 'absolute',
        maxWidth: '100vw',
        maxHeight: '100vh',
        minHeight: '100vh',
        minWidth: '100vw',
        border: 'none',
        margin: '0px',
        outline: 'none',
        overflow: 'hidden',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },

    albumWrapper: {
        position: 'relative',
        width: '75%',
        height: '85%',
        backgroundImage: 'url(https://imgur.com/KvlMf6g.png)',
        backgroundSize: '100% 100%',
        backgroundRepeat: 'no-repeat',
        borderRadius: '10px',
        padding: '0px',
    },

    album: {
        position: 'relative',
        width: '100%',
        height: '100%',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },

    currentPage: {
        position: 'relative',
        width: '36px',
        height: '36px',
        borderRadius: '50%',
        backgroundColor: '#fb5727',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        margin: '10px'
    },

    centerButtons: {
        position: 'absolute',
        width: '100%',
        height: '100%',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'center',
        pointerEvents: 'none',
    },

    centerButtonsAbs: {
        position: 'absolute',
        width: '100%',
        height: '100%',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'flex-end',
        pointerEvents: 'none',
    },

    comicPage: {
        height: '100%',
        width: '100%',
        backgroundColor: 'rgba(255, 255, 255,0.3)',
        display: 'flex',
    },

    comicPageWrapper: {
        position: 'relative',
        width: '100%',
        height: '100%',
    },
    photoFit: {
        position: 'relative',
        width: '100%',
        height: '100%',
        backgroundSize: 'cover',
        backgroundPosition: 'center center',
        backgroundRepeat: 'no-repeat',
    },

    drawline: {
        position: 'absolute',
        borderLeft: '15px rgba(32, 32, 32, 0.7) solid',
        height: '100%',
        left: '50%',
        marginLeft: '-5px',
    },

    pageAlbum: {
        position: 'absolute',
        backgroundColor: 'rgba(255, 255, 255, 0.4)',
        color: 'white',
        backdropFilter: 'saturate(180%) blur(12px)',
        marginTop: '3%',
    },


    photo: {
        position: 'relative',
        float: 'left',
        width: '46%',
        height: '44%',
        margin: '1.5%',
        backgroundColor: 'rgba(255, 255, 255, 1.0)',
        transform: 'rotate(-1deg)',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundImage: 'url(https://imgur.com/Sf1sDDR.png)',
    },

    photo2: {
        position: 'relative',
        float: 'left',
        width: '46%',
        height: '44%',
        margin: '1.5%',
        backgroundColor: 'rgba(255, 255, 255, 0.8)',
        transform: 'rotate(1deg)',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundImage: 'url(https://imgur.com/Sf1sDDR.png)',
    },

    realPhoto: {
        position: 'relative',
        width: '90%',
        height: '75%',
        margin: 'auto',
        marginTop: '1%',
        backgroundColor: '#fff',
    },

    photoWrapper: {
        position: 'relative',
        width: '100%',
        height: '100%',
        backgroundSize: '170% 100%',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'center center',
    },

    date: {
        position: 'relative',
        fontSize: '0.8em',
        fontFamily: 'Electrolize, sans-serif',
        textAlign: 'right',
        cursor: 'none',
        fontWeight: 'bold',

    },

    date2: {
        position: 'relative',
        fontSize: '1.0em',
        fontFamily: 'Electrolize, sans-serif',
        textAlign: 'right',
        cursor: 'none',
        fontWeight: 'bold',
    },

    photoFont: {
        fontSize: '1.0em',
        fontFamily: 'Cedarville Cursive, cursive',
        cursor: 'none',
        fontWeight: 'bold',
    },

    photoFontSize: {
        fontSize: '1.2em',
        fontFamily: 'Cedarville Cursive, cursive',
        cursor: 'none',
        fontWeight: 'bold',
    },

    openPhoto: {
        position: 'absolute',
        width: '43%',
        height: '75%',
        backgroundColor: 'rgba(255, 255, 255, 1)',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },

    marginPhoto: {
        margin: '10px',
        width: '90%',
        height: '90%',
        backgroundSize: '170% 100%',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'center center',
    },

    buttons: {
        position: 'absolute',
        top: '102%'
    },

    btnBottom: {
        position: 'relative',
        top: '-0.5%',
    },

    Screen: {
        position: 'absolute',
        height: '100%',
        width: '100%',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    SuperInput: {
        position: 'absolute',
        width: '400px',
        height: '150px',
        backgroundColor: '#222830',
    },
    SuperInputFix: {
        position: 'relative',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        top: '20px'
    },
    SuperBtnFix: {
        position: 'relative',
        top: '40px',
        left: '70px',
    },
    root: {
        "& .MuiInput-underline:after": {
            borderBottomColor: "white"
        },
        "& .MuiInput-underline:before": {
            borderBottomColor: "white"
        },
        "& .MuiInput-underline:hover:not(.Mui-focused):before": {
            borderBottomColor: "white"
        },
        '& .MuiInputBase-root': {
            color: 'white',
        },
    }
});