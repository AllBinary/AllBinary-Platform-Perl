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

package org::allbinary::graphics::form::item::CommandTextItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABTextItem';


sub _init_fields {
    my ($self) = @_;
    $self->{command} = undef;
}


sub new {
    my ($class, $command, $layout, $altText, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($command->getLabel(), $layout, $altText, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{command} = $command;
    return $self;
}


sub isFocusable {
    my ($self) = @_;
        return 1;
}


sub getCommand {
    my ($self) = @_;
        return $self->{command};
}

# use javax::microedition::lcdui::Command;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::ABTextItem;

1;

