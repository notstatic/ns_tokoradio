# s_tokoradio

Resurssi mahdollistaa radioiden käytön tokovoipin kanssa.

Lisää tämä tokovoip_script\s_config.lua:

```
TokoVoipConfig = {
	channels = {
		{name = "Virkavalta 1", subscribers = {}},
		{name = "Virkavalta 2", subscribers = {}},
		{name = "Virkavalta 3", subscribers = {}},
		{name = "Ensihoito", subscribers = {}},
		{name = "Mekaanikko", subscribers = {}},
		{name = "Taksi", subscribers = {}}
	}
};
```
