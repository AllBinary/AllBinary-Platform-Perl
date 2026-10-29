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

package org::allbinary::graphics::opengles::renderer::AllBinaryRendererBase3;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub update {
    my ($self, $gl) = @_;
        while ($self->{list}->size() > 0) {
            my $openGLESImage = $self->{list}->removeAt(0);
            if (defined($openGLESImage)) {
                $openGLESImage->set($gl);
            }
        }
}


sub add {
    my ($self, $image) = @_;
        $self->{list}->add($image);
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

