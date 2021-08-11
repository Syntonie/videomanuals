# Magic DaVE (4A) Quickstart

_Bless-ed is DaVE._

## Introduction

* `MENU` button interchangeably acts as go-up one level or return to the last menu section you viewed (it's unclear when it will do either).
* When turned on the controller will try to connect to the mainframe, and should automatically, and flash a bit. If not, select the connection from the menu.
* When the T-bar is moved watch what LEDs light up - it helps indicate what settings are being controlled.
* Colors are measured in HSL (hue, saturation, lightness):

```text
0 - 60 - 120 - 180 - 240 - 300
RED - YELLOW - GREEN - TURQOISE - BLUE - PURPLE
0% - 100%
MIN - MAX
```

## Joystick

The main joystick will control 3 parameters left-to-right in the menu system:

* `X AXIS` = 1st parameter 
* `Y AXIS` = 2nd parameter 
* `Z AXIS` ( _twist_ ) = 3rd parameter

The `XYZ buttons` reset parameters to defaults (but are occasionally odd, for example with Y scaling between NTSC and PAL).


## Sources / Structure

On a 4A, there are three video layers:

* `3 DVE` = top layer with keying + effects (DVE-F)
* `2 DSK` = top layer with keying (DSK)
* `1 BKGD` = raw bottom layer (BKGD-A)
* `DVE-B` = not used on a 4A
* `BKGD-B` = not used on a 4A

`DVE` and `DSK` can be swapped to be the uppermost layer using the TOP button (and the LED toggles between each button). 

`DVE` layer is where all the FX and majority of button menus do things. Any layer can be any video input, or an internal `MATTE` (colour) or `PATTERN` (gradients etc). 

`BKGD` will always be the bottomost layer. `DVE` and `DSK` can be interchanged as uppermost with `TOP` button. To test this out, luma key out both `DVE` and `DSK` (via `LUMA` button), to reveal `BKGD-A` below.

## Arranging Sources

`KEY`, `PROGRAM` and `PRESET` buttons are confusing because they don't act as individual source selectors. Instead:

* `DVE-F/DVE-B/DSK/BKGD-A/BKGD-B BUTTONS` = select the layer that you will now change via KEY BUS buttons;
* `KEY BUS` (yellow buttons) = selector for the source that's currently selected
* `PROGRAM` (red buttons) = BKGD-A, and the bottom-most layer (when BKGD-A source is selected, you will also see PROGRAM changing to the same)
* `PRESET` = presets, I guess

## T-Bar

T-Bar will control the 2nd parameter along in whatever menu you have up, unless you've pressed `WIPE` or `MIX`. When changing a menu parameter, `WIPE` and `MIX` are deselected and `USER` lights up. Selecting `USER` again will let make the T-Bar wipe that same parameter again - if DaVE allows it.

* `BKGRND/DVE/DSK` = puts it into next transition
* `CUT` = instant cut between sources
* `REV` = reverses WIPE or SEQUENCE (apparently)
* `STOP` = stops any sequence running, or goes to beginning of sequence when stopped
* `TAKE` = starts sequence, with time specified via Transition Control

NB: if you're trying to arrange 3 layers, then the T-Bar and these buttons will often "reset" settings around the assumption you're wiping two sources, and shunt settings into the submenus for the 3rd layer not being wiped. There's no indicator for any of this, so you'll lose orientation. Try n' feel it out (praise DaVE).

## Multiple Effected Layers

You can created multi-layer wipe blended scenes, by keeping `NEXT TRANSITION` to DSK, then using the DVE to crop and mask.

`EXT-KEY `= define the wipe for the top layer DVE, in which case, you can;

Navigate to `DVE > EXT-KEY > MASK` and then press-and-hold `USER-[N]` to save the menu view. Now when you press the `USER-[N]` button the T-Bar will wipe the DVE. When you press the default WIPE button you will wipe the DSK - ie. _TRIPLE LAYER WIPES_ c'est possible.

## External Keying

Not so clear - there are two multi-toggle options under `EXT-KEY` option. Mashing these around and the input on the isolated "KEY I/O" port on the mainframe will be used (but without any threshold parameters).

## Transition Select

* `SUPER` = dissolve with a colour matte
* `MIX` = normal dissolve wipe
* `WIPE` = shape wipe
* `SEQUENCE` = a preprogrammed sequence (see sequencing)
* `USER` = whatever the current menu page is, or was
* `BLACK` = black	

## DVE Control Group

All these are "quick-access" buttons to change parameters for the `DVE` top layer, and the same as having pressed `MENU > START > MAIN`;

* `MODEL` = wipes like page turn, ripples etc
* `LIGHT` = lighting effect
* `EFFECT` = solarisation, polarisation, colour keying
* `SHADOW` = shadows for MODELs, inc. trail-shadow...
* `BORDER` = borders around wipe or layer rectangle
* `CROP` = cropping the layer rectangle
* `TRAIL` = only on some systems, doesn't work on mine
* `FREEZE` = freeze frame

## DVE Transition Group

* `TRANSFORM` = submenu for DVE
	* `REFLECT` = use back and front image
	* `INPUT` = position of input, before;
	* `PRE` = position of image, before;
	* `MAIN` (aka `POSITION`) = position of DVE, before;
	* `OUTPUT` = position of entire output
* `POSITION` (aka `TRANSFORM -> MAIN`) = position (4 options)
* `ANGLE` = main angle (3 options)
* `AXIS` = main axis (3 options)
* `SPIN` = main spin (3 options)
* `SIZE` = can be accessed by pressing `TRANSFORM` twice; use to resize from PAL or NTSE (2 options)

## Wipe / Sequence / Alpha Controls

There are 24 buttons with pictures of wipes on them; these are also used to select sequences (`SEQUENCE`) or letters (`ALPHA` aka _alphabet_):

* `WIPE` = enable selecting a wipe from the 24
* `SEQUENCE` = enable selecting a sequence form the 24
* `ALPHA` = enable selecting a big letter (uhhh)
* `USER 1/2/3/4` = press + hold to store a wipe here, press once to recall

## Sequencing

The 4A can store 24 "sequences" in RAM, made up of many "shots" (configurations of local settings, from Transform Groups), then assigned to the T-Bar, or played back via TAKE.

* `ENABLE` = when flashing, you are in edit mode
* `INSERT` = adds current settings as new shot
* `PREVIOUS` = loads previous shot, or previous sequence
* `CURRENT` = reloads shot, or reloads sequence
* `NEXT` = loads next shot, or next sequence
* `DELETE` = deletes current shot
* `UNDO` = undoes last action (max 100)
* `MODIFY` = sets shot to current local settings (ie. SET)
	* -> `HERE` <- = only save to current shot
	* <- `MODIFY` = also save to preceding shots
	* `MODIFY` -> = also save to proceeding shots
	* <- `ALL` -> = also save to all other shots
	* `PROPERTIES` = edits encompassing sequence settings

In editing mode, time is related to the shot, in sequence mode, to the sequence time.

## System Buttons

* `SETUP` = internal system settings
* `DISK` = internal storage settings
* `FILE` = internal EPROM settings
* `ABOUT` = firmware version, model etc
* `USER 1/2/3/4` = press+hold to store the current menu view, so that it can be recalled

## Keypad Group

* `NUMERICAL KEYS` = type in numbers
* `DELETE` = acts as backspace, not delete
* `ESC` = acts as delete / undo
* `ENTER` = numbers must match exact decimal places to be entered (ie. 1.000 => 0.120, and not 0.12)
* `CURSOR` = enables "preview output cursor"? no idea.

## Misc Controls

* `SNAP` = snaps parameters to power of 2
* `MAGIC` = "reserved for future use" 🛸
* `NORMAL` = resets different controls
	* `ONE-PRESS` = reset current controls
	* `TWO-PRESSES` = opens menu to select resetting all controls (Internal and External)
	* `THREE-PRESSES` = reset everything (aka: fuck-it)
* `SAVE` = save current sequences
	* `ONE-PRESS` = bring up menu
	* `TWO-PRESSES` = "allows DMEM to be saved"
	* `THREE-PRESSES` = will actually save
* `RECALL` = same as above, but recalling sequences
* `CANCEL` = cancel
* `OK` = enter key

## Whole Menu

You can navigate the entire system, via the MENU button, where the physical interface acts as a submenu quick-select. 

* `MENU`
	* `START`
		* `MODELS` = goes to top-level MODELS menu (DVE only)
		* `TRANSFORM` = goes to top-level TRANSFORM menu (DVE only)
		* `EFFECTS` = goes to top-level EFFECTS menu (DVE only)
		* `WIPES` = goes to generic WIPES menu
		* `SOURCES` = select "KEY-BUS" source via menu, allows you to view cool test patterns and shapes
		* `FREEZE` = goes to FREEZE menu (DVE only)
		* `TRAIL` = goes to TRAIL menu (DVE only)
		* `CHANNEL` = goes to CHANNEL menu (different mainframes)
		* `SEQCACHE` = akin to SEQUENCE buttons (recall, save etc)
		* `SEQCTRL`✱ = granular control of sequences
	* `FILE`✱
	* `DISK`✱
	* `SETUP`✱

✱ = menus that aren't also a front panel button

## Credits

Written by [Autr](https://instagram.com/autr.tv)