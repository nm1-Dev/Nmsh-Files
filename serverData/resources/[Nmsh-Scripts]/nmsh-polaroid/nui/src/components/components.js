

import { Button } from "@mui/material";
export const Buttons = ({variant, text, icon, onClick}) => {

    return (
        <>
            {variant === 1 ?
                <Button variant="contained" onClick={onClick} sx={{width: 'auto', height: '30px', bgcolor: '#95ed74', color: 'black', marginLeft: '10px', borderRadius: '5px', ':hover': {bgcolor: '#619a4b'} }}>
                    <i className={icon} style={{ color: "black" , margin: '3px'}}></i>
                    {text}
                </Button>
            : 
                <Button variant="contained" onClick={onClick} sx={{width: 'auto', height: '30px', bgcolor: '#eaa56e', color: 'black', marginLeft: '10px', borderRadius: '5px',':hover': {bgcolor: '#986c49'}}} >
                    <i className={icon} style={{ color: "black" , margin: '3px'}}></i>
                    {text}
                </Button>
            }
        </>
    )
}
