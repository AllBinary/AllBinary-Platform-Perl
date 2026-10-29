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

package org::allbinary::animation::vector::LineAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicColor} = undef;
}


sub new {
    my ($class, $basicColor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicColor} = $basicColor;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::vector::LineAnimation'->new($self->{basicColor});
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::vector::LineAnimation;

1;

