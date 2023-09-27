import { useState } from 'react';
import { useStyles } from './index.styles';
import { Zoom, Button } from '@mui/material';
import { useNuiEvent } from '../../hooks/useNuiEvents';
import { fetchNui } from '../../hooks/fetchNui';
const CameraPNG = 'https://imgur.com/d5MysQs.png';

export const Camera = ({langProvider}) => {
  const classes = useStyles()

  const [zoom, setZoom] = useState(false);
  const [Look, setLook] = useState(false);

  useNuiEvent('OpenCamera', (props) => {
    setZoom(true)
  });

  useNuiEvent('CloseCamera', (props) => {
    setZoom(false)
  });

  useNuiEvent('PolaroidLook', (props) => {
    setLook(props.show)
  });


  const SendToClient = (props) => {
    fetchNui('CameraEffect', { props })
  }

  return (
    <div>
      <Zoom in={zoom}>
        <div className={classes.wrapper}>
          <div className={classes.camera} style={{ backgroundImage: `URL${CameraPNG}` }}>
          </div>
          <div className={classes.steps}>
            <div className={classes.style}>

              <div className={classes.fontTutorial}>{langProvider.instruction1}</div>
              <div className={classes.fontTutorial}>{langProvider.instruction2}</div>
              <div className={classes.fontTutorial}>{langProvider.instruction3}</div>
              <div className={classes.how}>
                <Button variant="contained" sx={{ bgcolor: '#e978d8', color: 'white', '&:hover': { bgcolor: '#e978d8', color: 'white' } }} style={{ margin: '5px' }}>
                  <i className="fa-solid fa-question" style={{ color: "white", margin: '3px' }}></i>
                    {langProvider.instruction4}
                </Button>
              </div>
            </div>
          </div>
          <div className={classes.stylesMap}>
            {Look && langProvider.FILTERS.map((id, index) => (
              <div className={classes.styleButton} key={index} onClick={() => { SendToClient(id) }}>
                <div className={classes.fontStyle}>
                  {id.style}
                </div>
              </div>
            ))}

          </div>
        </div>
      </Zoom>
    </div>
  )
}
