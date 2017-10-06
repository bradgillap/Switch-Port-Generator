# Switch-Port-Generator
This Powershell GUIscript makes it very quick to generate network port configurations from the console or ssh. This script has graduated to its own repo, that's how useful it has been to me.

![Image of script](https://raw.githubusercontent.com/bradgillap/Switch-Port-Generator/master/img/portconv.png)

## How does it work?

I built this script in my downtime because I'm too forgetful to remember several different port configurations for single switches or stacks. The script generates the interface number to the corresponding checkbox automatically. This can be used for just about any manufacturing type of switch with minimal changes.

### A Poor Example
Typically you enter configuring a single port into the terminal by typing something like f
```
[Manufacture]# interface gigabitethernet 1/0/24
```

From this point your terminal changes to the switch number and port number to designate that the following commands will fall under that particular port.

```
[intg1/0/24]# enable someprotocol
```

You're likely best off just running the script yourself and playing with the buttons to get a sense of what can be done with it.

## Editing for Use

- Near line 40 you'll find the select interface commands. 
- near line 100 you'll find the port options that get plugged in. Since every environment is different, this has been purposefully left up to the network administrator.

## ToDo

- Probably a dropdown to pick various switch manufacturers which would change how the select interface command is issued.
- Contributions are welcome!


## Thanks

Thanks to Bryan Hughes, who helped me work out some of the more difficult string bits with a clever looped list array.
