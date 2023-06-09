from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default


class Scheme(Default):
    light_green = 108
    dark_green = 65

    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.directory and not context.marked and not context.link \
                and not context.inactive_pane:
            fg = self.light_green

        if context.in_titlebar and context.hostname:
            fg = self.dark_green

        if context.media:
            fg = self.light_green

        return fg, bg, attr

