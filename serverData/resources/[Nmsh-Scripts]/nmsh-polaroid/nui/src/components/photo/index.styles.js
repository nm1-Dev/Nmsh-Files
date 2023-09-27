import { makeStyles } from '@mui/styles';

export const useStyles = makeStyles({
    wrapper: {
        position: 'absolute',
        top: '30%',
        left: '1%',
    },

    image: {
        position : 'absolute',
        width: '400px',
        height: '400px',
        backgroundColor: 'rgba(255, 255, 255, 1)',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        border: '1px solid rgba(0, 0, 0, 1.0)',
        marginLeft: '-75%',
    },

    marginPhoto : {
        margin: '10px',
        width: '90%',
        height: '90%',
        backgroundSize: '170% 100%',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'center center',
    },

    date2: {
        position : 'relative',
        fontSize: '1.0em',
        fontFamily: 'Electrolize, sans-serif',
        cursor: 'none',
        textAlign: 'center',
    },

    photoFontSize: {
        fontSize: '1.2em',
        fontFamily: 'Cedarville Cursive, cursive',
        cursor: 'none',
        fontWeight: 'bold',
    },

});