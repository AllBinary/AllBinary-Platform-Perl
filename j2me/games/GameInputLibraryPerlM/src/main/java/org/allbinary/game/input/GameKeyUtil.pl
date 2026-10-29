#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::game::input::GameKeyUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::GameKeyUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isDirectionKey {
    my ($self, $key) = @_;
        if ($key == $javax::microedition::lcdui::Canvas::UP || $key == $javax::microedition::lcdui::Canvas::DOWN || $key == $javax::microedition::lcdui::Canvas::LEFT || $key == $javax::microedition::lcdui::Canvas::RIGHT) {
            return 1;
        } else {
            return 0;
        }
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::GameKeyUtil::instance;
}

# use javax::microedition::lcdui::Canvas;

1;

