### Swapping Keys on Alpine Linux

It sounds like the `kbd` package, which contains the `loadkeys` command, isn't installed on your Alpine system by default. Alpine Linux is known for being minimal, so it often requires you to install utilities as you need them.

You can install the `kbd` package with the following command:

```sh
sudo apk add kbd
```

  * `apk` is the package manager for Alpine Linux.
  * `add` is the command to install a new package.
  * `kbd` is the name of the package that contains the `loadkeys` utility.

After running this, the `loadkeys` command should be available and you can continue with the steps to swap the Caps Lock and Escape keys.

---

To make the keymap change permanent on Alpine Linux, you'll need to edit the `/etc/conf.d/keymap` file. This file is part of Alpine's `openrc` init system and is used to configure various system settings, including the keyboard layout.

1.  **Create the Keymap File:**
    Just like before, create your keymap file with the key bindings you want.

    ```bash
    mkdir -p ~/.config/keymaps
    nano ~/.config/keymaps/swap_keys.kmap
    ```

    Add the following content to the file:

    ```
    keycode 58 = Escape
    keycode 1 = Caps_Lock
    ```

2.  **Edit the Keymap Configuration:**
    Now, you'll edit the main configuration file to tell Alpine to load your custom keymap.

    ```bash
    sudo nano /etc/conf.d/keymap
    ```

    Look for the line that starts with `keymap=`. It might be commented out. You need to uncomment it and change the value to the full path of your custom keymap file. The line should look like this:

    ```bash
    keymap="/home/your_username/.config/keymaps/swap_keys.kmap"
    ```

    *Remember to replace `your_username` with your actual username.*

3.  **Apply the Changes:**
    You can apply the changes immediately by running the `loadkeys` command again with your new file, or you can reboot the system. The new keymap will be loaded automatically during the next boot.

    ```bash
    sudo loadkeys /home/your_username/.config/keymaps/swap_keys.kmap
    ```

This approach ensures that your custom keymap is part of the system's configuration and is loaded consistently every time you start up. Let me know if you run into any issues or want to try a different key combination.
