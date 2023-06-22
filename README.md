# ***Nightlyte dotfiles*** 
Themes/Fonts/Configs that I use.

# **Linux**

## **Shell** 
> ![nightlyte-kush](https://github.com/nightlyte-dev/dotfiles/assets/131328638/1aec003d-341c-43a3-974e-4f2fdbb69f79)
> ### Zsh
>  * Oh My Zsh
>    - *Plugins*: `copypath git sudo zsh-autosuggestions zsh-syntax-highlighting`
>  * Oh My Posh
>    - *Theme*: `nightlyte-kush.omp.json`
>  * Font
>    - Mononoki Nerd Font
>      - 14pt
>    - Apple Color Emojis



## **Themes**
### *KDE Plasma*
> ![nightlyte-desktop](https://github.com/nightlyte-dev/dotfiles/assets/131328638/5ae5ab53-c6be-43b0-aefe-f4c09c51d0f2)
> ### ***Theme*** 
> * LayanDark (Enabled w/ Kvantum Manager)
>
> ### ***Icons***
> * Tela Blue Dark
>
> ### ***Cursors***
> * Bibata Modern Classic
>
> ### ***SDDM Login Theme***
> * Sugar Candy



# Helpful Commands
<details>
  <summary> 
    <b> Installing multiple fonts zips at once </b>
  </summary>

  ```bash
  # Download font zips from here - https://www.nerdfonts.com/font-downloads
  cd <your_font_zips>
  # next command extracts all TTF and OTF files into your `.fonts` folder.
  unzip "*.zip" "*.ttf" "*.otf" -d ${HOME}/.fonts
  # next command rebuilds font cache
  sudo fc-cache -f -v
  ```
  
</details>

<details>
  <summary> 
    <b> Importing/exporting gnome terminal profiles (gnome-terminal-profiles.dconf) </b>
  </summary>

  ```bash
  #Export profile to file
  dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/gnome-terminal-profiles.dconf

  #Import profile from file
  dconf load /org/gnome/terminal/legacy/profiles:/ < /$LOCATION/gnome-terminal-profiles.dconf
  ```
  If you don't have dconf editor, you can install it with
  ```bash
  sudo apt-get install dconf-editor
  ```

</details>



