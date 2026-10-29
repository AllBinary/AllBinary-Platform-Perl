# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::animation::text::CustomTextBoxIndexedAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{scaleProperties} = undef;
    $self->{maxLength} = undef;
}


sub new {
    my ($class, $fontSize, $maxLength) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{scaleProperties} = 'org::allbinary::media::ScaleProperties'->new();
        $self->{scaleProperties}->{scaleHeight} = $fontSize;
        $self->{maxLength} = $maxLength;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $abToGBUtil = 'org::allbinary::game::canvas::ABToGBUtil'->getInstance();
        my $abCanvas = $abToGBUtil->{abCanvas};
        my $font = 'javax::microedition::lcdui::Font'->getFont($javax::microedition::lcdui::Font::FACE_SYSTEM, $javax::microedition::lcdui::Font::STYLE_PLAIN, $self->{scaleProperties}->{scaleHeight});
        my $customTextBox = 'org::allbinary::animation::text::CustomTextBox2'->new($abCanvas->getCustomCommandListener(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{maxLength}, $javax::microedition::lcdui::TextField::ANY, $font, $abCanvas->getLayerManager()->getBackgroundBasicColor(), $abCanvas->getLayerManager()->getForegroundBasicColor());
        return 'org::allbinary::animation::text::CustomTextBoxIndexedAnimation'->new($customTextBox);
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
        my $fontSize = $self->{scaleProperties}->{scaleHeight};
        $self->{scaleProperties} = $scaleProperties;
        if ($self->{scaleProperties}->{scaleHeight} < 6) {
            $self->{scaleProperties}->{scaleHeight} = $fontSize;
        }
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::TextField;
use org::allbinary::graphics::form::item::CustomTextBox;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::game::canvas::ABToGBUtil;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::text::CustomTextBox2;
use org::allbinary::animation::text::CustomTextBoxIndexedAnimation;

1;

