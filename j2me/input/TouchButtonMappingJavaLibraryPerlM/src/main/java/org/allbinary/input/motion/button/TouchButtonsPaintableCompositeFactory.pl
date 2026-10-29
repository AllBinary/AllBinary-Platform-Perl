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

package org::allbinary::input::motion::button::TouchButtonsPaintableCompositeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $inputMappingInterface, $basicColor) = @_;
        return 'org::allbinary::input::motion::button::TouchButtonsPaintableComposite'->new($inputMappingInterface, $basicColor);
}

use org::allbinary::game::input::mapping::InputMappingInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::paint::ProcessPaintable;
use org::allbinary::input::motion::button::TouchButtonsPaintableComposite;

1;

