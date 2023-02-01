from typing import List
from kitty.boss import Boss

# in main, STDIN is for the kitten process and will contain
# the contents of the screen
def main(args):
    return 'sys.stdin.read()'

# in handle_result, STDIN is for the kitty process itself, rather
# than the kitten process and should not be read from.
from kittens.tui.handler import result_handler
@result_handler(type_of_input='text')
def handle_result(args, stdin_data, target_window_id, boss):
    w = boss.window_id_map.get(target_window_id)
    if w is not None:
        w.paste(stdin_data)
