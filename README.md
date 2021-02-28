# mac-dictionary-retriver
To get html content from Dictionary on macOS with HTTP requests

## Build and start server
```sh
make
make start-server
```

## Usage

### Params
- `word`: the word to look up
- `dictionary`: dictionary name (Could check `Preferences...` in Dictionary)

### Request
```
curl 'localhost:8768/?word=baseball&dictionary=New%20Oxford%20American%20Dictionary'
```

### Response
```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"><head/><body><d:entry id="m_en_gbus0075840" d:title="baseball" class="entry"><span class="hg x_xh0"><span role="text" d:syl="1" class="hw">base·ball<d:syl/></span><span dialect="AmE" prxid="baseball_us_n" prlexid="pron0004652.002" class="prx"> | <span d:prn="US" dialect="AmE" class="ph t_respell">ˈbāsˌbôl<d:prn/></span> | </span></span><span class="sg"><span id="m_en_gbus0075840.004" class="se1 x_xd0"><span role="text" class="posg x_xdh"><span d:pos="1" class="pos"><span class="gp tg_pos">noun </span><d:pos/></span></span><span id="m_en_gbus0075840.005" class="msDict x_xd1 t_core"><span d:def="1" role="text" class="df">a ball game played between two teams of nine on a field with a diamond-shaped circuit of four bases. It is played chiefly in the US, Canada, Latin America, and East Asia<d:def/></span><span role="text" class="gp tg_df">: </span><span role="text" class="eg"><span class="ex"> a game of baseball</span><span class="gp tg_eg"> | </span></span><span role="text" class="eg"><span role="text" class="gg"><span class="gp tg_gg">[</span>as <span class="sy">modifier</span><span class="gp tg_gg">] </span></span><span class="ex"><span class="lbl">:  </span>a baseball player</span><span class="gp tg_eg">. </span></span><span role="text" class="gp tg_msDict"> </span></span><span id="m_en_gbus0075840.007" class="msDict x_xd1 hasSn t_subsense"><span role="text" class="gp sn tg_msDict">  • </span><span role="text" class="df">the hard ball used in the game of baseball<span class="gp tg_df">. </span></span></span></span></span></d:entry></body></html>
```

## TODO
- integrate Objective C into Python
