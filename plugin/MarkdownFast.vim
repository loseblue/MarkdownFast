" check the vim supports python
if !has('python')
    echo 'Error: Required vim compile with +python'
    finish
endif

python << EOF
import vim

class MdFast:
    def strQ2B(self, ustring):
        rstring = ""
        for uchar in ustring:
            inside_code=ord(uchar)
            if inside_code == 12288:
                inside_code = 32 
            elif (inside_code >= 65281 and inside_code <= 65374):
                inside_code -= 65248

            rstring += unichr(inside_code)
        return rstring

    def addHeader(self, lvl):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        # print "Lines: {0}".format(len(cur_buf))
        # print "Contents: {0}".format(cur_line_buf)
        if '1'==lvl :
            vim.current.line = '# '+cur_line_buf
        elif '2'==lvl :
            vim.current.line = '## '+cur_line_buf
        elif '3'==lvl :
            vim.current.line = '### '+cur_line_buf
        elif '4'==lvl :
            vim.current.line = '#### '+cur_line_buf
        else:
            print "Contents: {0}".format(cur_line_buf)

    def rmSpace(self):
        i = 0
        cur_buf = vim.current.buffer
        all_buf_len = len(vim.current.buffer)
        while (i < all_buf_len):
            tmp_len_buf = self.strQ2B(cur_buf[i].decode('utf-8'))
            tmp_len_buf = tmp_len_buf.strip(' ')

            if not len(tmp_len_buf):
                del vim.current.buffer[i]
                all_buf_len = all_buf_len-1 # becauseof del line
            else:
                vim.current.buffer[i] = tmp_len_buf
                i = i+1

    def addLineBackquote(self):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        vim.current.line = '`' + cur_line_buf + '`'

    def addLineStrong(self):
        cur_buf = vim.current.buffer
        cur_line_buf = vim.current.line
        vim.current.line = '**' + cur_line_buf + '**'

EOF

command! -nargs=1 MdAddHeader exec('py MdFast().addHeader(<f-args>)')
command! -nargs=0 MdRmSpace exec('py MdFast().rmSpace()')
command! -nargs=0 MdAddLineBackquote exec('py MdFast().addLineBackquote()')
command! -nargs=0 MdAddLineStrong exec('py MdFast().addLineStrong()')
