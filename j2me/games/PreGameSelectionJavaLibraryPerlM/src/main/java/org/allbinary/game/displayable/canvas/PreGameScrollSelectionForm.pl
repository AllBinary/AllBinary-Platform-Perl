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

package org::allbinary::game::displayable::canvas::PreGameScrollSelectionForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ScrollCurrentSelectionForm';



sub new {
    my ($class, $title, $items, $formPaintableFactory, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $items, $formPaintableFactory, 0, 3, 0, $backgroundBasicColor, $foregroundBasicColor);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self, $rectangle) = @_;
        $self->SUPER::init($rectangle, 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->{TEMP_HORIZONTAL_FORM});
}

use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::FormTypeFactory;
use org::allbinary::graphics::form::ItemPaintableFactory;
use org::allbinary::graphics::form::ScrollCurrentSelectionForm;

1;

