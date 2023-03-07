    " Arduino
        let g:arduino_cmd = '/usr/bin/arduino'                      "Runtime Path
        let g:arduino_dir = '/usr/share/arduino'                    "Arduino home dir
        let g:arduino_board = 'arduino:avr:uno'                     "Your Arduino type
        nnoremap <buffer> <leader>am :ArduinoVerify<CR>
        nnoremap <buffer> <leader>au :ArduinoUpload<CR>
        nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
        nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
        nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>


