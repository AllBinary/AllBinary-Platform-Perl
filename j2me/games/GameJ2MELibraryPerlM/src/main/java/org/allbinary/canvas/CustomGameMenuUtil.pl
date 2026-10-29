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

package org::allbinary::canvas::CustomGameMenuUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub add {
    my ($class, $canvas) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        if ('org::allbinary::AppletUtil'->isAppletLoader($canvas)) {
        } elsif ('org::allbinary::J2MEUtil'->isHTML()) {
        } else {
            $canvas->addCommand($gameCommandsFactory->{EXIT_COMMAND});
        }
}

use org::allbinary::AppletUtil;
use org::allbinary::J2MEUtil;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::graphics::displayable::MyCanvas;

1;

