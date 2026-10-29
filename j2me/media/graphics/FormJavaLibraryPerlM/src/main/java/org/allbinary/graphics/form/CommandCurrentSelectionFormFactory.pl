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

package org::allbinary::graphics::form::CommandCurrentSelectionFormFactory;
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
    my ($class, $title, $items, $rectangle, $formType, $border, $moveForSmallScreen, $backgroundBasicColor, $foregroundBasicColor) = @_;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance()->{TOUCH_ENABLED})) {
            my $scrollSelectionForm = 'org::allbinary::graphics::form::CommandCurrentSelectionForm'->new($title, $items, $border, $moveForSmallScreen, $backgroundBasicColor, $foregroundBasicColor);
            $scrollSelectionForm->init($rectangle, $formType);
            return $scrollSelectionForm;
        } else {
            return 'org::allbinary::graphics::form::ScrollSelectionFormNoneFactory'->getInstance();
        }
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::TouchFeatureFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::form::ScrollSelectionFormNoneFactory;
use org::allbinary::graphics::form::CommandCurrentSelectionForm;

1;

