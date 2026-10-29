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

package org::allbinary::animation::image::BaseImageAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationFactoryImageScaleUtil} = 'org::allbinary::image::AnimationFactoryImageScaleUtil'->getInstance();
    $self->{image} = undef;
    $self->{animationBehaviorFactory} = undef;
    $self->{sequenceArray} = undef;
    $self->{animationFactoryInitializationVisitor} = undef;
    $self->{scaleProperties} = $org::allbinary::media::ScaleProperties::instance;
}


# throws Exception
sub createFactoryBase {
    my ($class, $image, $sequenceArray, $width, $height, $animationBehaviorFactory) = @_;
        return 'org::allbinary::animation::image::BaseImageAnimationFactory'->new($image, $sequenceArray, $width, $height, 0, 0, $animationBehaviorFactory);
}


sub new {
    my ($class, $image, $sequenceArray, $width, $height, $dx, $dy, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{animationFactoryInitializationVisitor} = 'org::allbinary::animation::image::AnimationFactoryInitializationVisitor'->new();
        $self->{image} = $image;
        $self->{animationFactoryInitializationVisitor}->{width} = $width;
        $self->{animationFactoryInitializationVisitor}->{height} = $height;
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
        $self->{sequenceArray} = $sequenceArray;
        $self->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{dy} = $dy;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance($instanceId);
}


sub getImage {
    my ($self) = @_;
        return $self->{image};
}


sub getSequenceArray {
    my ($self) = @_;
        return $self->{sequenceArray};
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
        $self->{scaleProperties} = $scaleProperties;
        if ($self->{scaleProperties}->{shouldScale}) {
            $self->{scaleProperties}->{scaleWidth} = int(($self->{animationFactoryInitializationVisitor}->{width} * $self->{scaleProperties}->{scaleX}));
            $self->{scaleProperties}->{scaleHeight} = int(($self->{animationFactoryInitializationVisitor}->{height} * $self->{scaleProperties}->{scaleY}));
        } else {
        }
}


sub getAnimationFactoryInitializationVisitorP {
    my ($self) = @_;
        return $self->{animationFactoryInitializationVisitor};
}


sub getScalePropertiesP {
    my ($self) = @_;
        return $self->{scaleProperties};
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append($commonLabels->{HEIGHT_LABEL});
        $stringBuffer->appendint(int($self->{image}->getHeight()));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($self->{animationFactoryInitializationVisitor}->toString());
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::image::AnimationFactoryImageScaleUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::ScaleProperties;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::animation::image::AnimationFactoryInitializationVisitor;

1;

