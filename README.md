# ns_tokoradio


### FI 
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
### EN

This resource is giving possibility to use radios with tokovoip.


Add this to tokovoip_script\s_config.lua:

```
TokoVoipConfig = {
	channels = {
		{name = "PD/SO 1", subscribers = {}},
		{name = "PD/SO 2", subscribers = {}},
		{name = "PD/SO 3", subscribers = {}},
		{name = "EMS", subscribers = {}},
		{name = "Mechanic", subscribers = {}},
		{name = "Taxi", subscribers = {}}
	}
};
```
