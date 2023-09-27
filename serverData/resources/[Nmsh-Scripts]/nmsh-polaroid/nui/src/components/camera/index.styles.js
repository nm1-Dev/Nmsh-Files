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
        padding : '0px',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },

    camera: {
        position: 'relative',
        width: '100%',
        height: '100%',
        backgroundImage: 'URL(https://imgur.com/nwc5hRO.png)',
        backgroundSize: '100% 100%', 
        backgroundRepeat: 'no-repeat',
    },

    steps: {
        position: 'absolute',
        width: '250px',
        height: '120px',
        borderRadius: '5px',
        marginLeft: '-80%',
        backgroundColor: 'white',
    },

    style: {
        position: 'absolute',
        fontFamily: 'Arial, sans-serif',
        fontSize: '1.0em',
    },

    fontTutorial: {
        margin: '15px',
    },

    how: {
        position: 'relative',
        top: '-110px',
        left: '160px',
    },

    stylesMap: {
        position: 'absolute',
        width: '15%',
        height: '80%',
        marginLeft: '80%',
        overflow: 'hidden',
        overflowY: 'scroll',
    },


    styleButton: {
        position: 'relative',
        height: '40px',
        width: '94%',
        borderRadius: '5px',
        backgroundColor: '#222830',
        margin: '10px',
        border: '1px solid black',
        cursor: 'pointer',
        transition: 'all 0.1s ease-in-out',
        '&:hover': {
            backgroundColor: '#334760',
        },
    },

    fontStyle: {
        color: 'white',
        fontFamily: '"Roboto", "Helvetica", "Arial", sans-serif',
        margin: '10px',
        cursor: 'pointer',
        textShadow: '-1px 1px 0 #37474f, 1px 1px 0 #37474f, 1px -1px 0 #37474f, -1px -1px 0 #37474f',
    }
});