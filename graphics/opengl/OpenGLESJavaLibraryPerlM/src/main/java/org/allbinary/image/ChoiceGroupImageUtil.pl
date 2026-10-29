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

package org::allbinary::image::ChoiceGroupImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::ChoiceGroupImageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::ChoiceGroupImageUtil::instance;
}


sub init {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $choiceGroupFactory = 'javax::microedition::lcdui::ChoiceGroupImageFactory'->getInstance();
        my $imageArray = $choiceGroupFactory->getImageArray();
        if ($features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            my $preResourceImageUtil = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
            my $size = scalar(@{$imageArray});
            for (my $index = 0; $index < $size; $index++) {
                $imageArray->[$index] = $preResourceImageUtil->encapsulate($imageArray->[$index]);
            }
            $choiceGroupFactory->init($imageArray);
        }
}


sub update {
    my ($self, $gl) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $choiceGroupFactory = 'javax::microedition::lcdui::ChoiceGroupImageFactory'->getInstance();
        my $imageArray = $choiceGroupFactory->getImageArray();
        if ($features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            my $preResourceImageUtil = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
            my $size = scalar(@{$imageArray});
            for (my $index = 0; $index < $size; $index++) {
                $preResourceImageUtil->updateGL($gl, $imageArray->[$index]);
            }
        }
        $choiceGroupFactory->init($imageArray);
}


# Java overloaded method: Perl keeps the last definition
sub update {
    my ($self, $graphics) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $choiceGroupFactory = 'javax::microedition::lcdui::ChoiceGroupImageFactory'->getInstance();
        my $imageArray = $choiceGroupFactory->getImageArray();
        if ($features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            my $preResourceImageUtil = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
            my $size = scalar(@{$imageArray});
            for (my $index = 0; $index < $size; $index++) {
                $preResourceImageUtil->update($graphics, $imageArray->[$index]);
            }
        }
        $choiceGroupFactory->init($imageArray);
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::ChoiceGroupImageFactory;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::image::PreResourceImageUtil;

1;

