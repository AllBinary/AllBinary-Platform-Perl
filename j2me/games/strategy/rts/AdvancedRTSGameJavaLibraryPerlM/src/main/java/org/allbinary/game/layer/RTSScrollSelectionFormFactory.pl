# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::RTSScrollSelectionFormFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $formLabel, $items) = @_;
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        my $touchButtonLocationHelper = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $menuX = 'org::allbinary::input::motion::button::CommonButtons'->getInstance()->{STANDARD_BUTTON_SIZE} + $touchButtonLocationHelper->getColumnsRemainderHalf();
        my $width = $displayInfo->getLastWidth() - ($menuX * 2);
        my $menuRectangle = 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->createXY($menuX, 16), $width, 'org::allbinary::input::motion::button::CommonButtons'->getInstance()->{STANDARD_BUTTON_SIZE});
        return 'org::allbinary::graphics::form::MultipleScrollSelectionHorizontalForm'->createForm($formLabel, $items, $menuRectangle, 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->{HORIZONTAL_FORM}, 0, $basicColorFactory->{BLACK}, $basicColorFactory->{WHITE});
}

use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::form::FormTypeFactory;
use org::allbinary::graphics::form::MultipleScrollSelectionHorizontalForm;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::input::motion::button::TouchButtonLocationHelper;

1;

