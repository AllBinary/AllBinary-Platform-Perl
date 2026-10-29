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

package org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLFeatureUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{anyThreed} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLFeatureUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $openGLConfiguration = 'org::allbinary::graphics::opengles::OpenGLConfiguration'->getInstance();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        $self->{anyThreed} = $openGLConfiguration->isOpenGL() && ($features->isFeature($openGLFeatureFactory->{OPENGL_2D_AND_3D}) || $features->isFeature($openGLFeatureFactory->{OPENGL_3D}));
    return $self;
}


sub isAnyThreed {
    my ($self) = @_;
        return $self->{anyThreed};
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLConfiguration;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;

1;

