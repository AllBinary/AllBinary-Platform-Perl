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

package org::allbinary::image::opengles::OpenGLESImageExclusionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::opengles::OpenGLESImageExclusionUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EXCLUSION} = "font";
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::opengles::OpenGLESImageExclusionUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isCustomScaling {
    my ($self, $image) = @_;
        my $imageName = $image->getName();
        my $isNormalScaling = $self->{list}->size() == 0 || (index($imageName, $self->{EXCLUSION}) == 0);
        if ($isNormalScaling) {
            return 0;
        } else {
            my $size = $self->{list}->size();
            my $name = undef;
            for (my $index = 0; $index < $size; $index++) {
                $name = $self->{list}->get($index);
                if ((index($imageName, $name) == 0)) {
                    $isNormalScaling = 1;
                }
            }
        }
        if ($isNormalScaling) {
            return 0;
        } else {
            return 1;
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

