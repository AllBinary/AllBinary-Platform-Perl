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

package org::allbinary::graphics::opengles::OpenGLCapabilities;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::opengles::OpenGLCapabilities'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{CUSTOM_GL_SURFACE_VIEW} = 1;
    $self->{VERSION_1_0} = "1.0";
    $self->{VERSION_1_1} = "1.1";
    $self->{VERSION_2_0} = "2.0";
    $self->{VERSION_3_0} = "3.0";
    $self->{VERSION_3_1} = "3.1";
    $self->{VERSION_3_2} = "3.2";
    $self->{VERSION_HIGHER_THAN_EXISTS} = "999.999";
    $self->{glVersion} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{shaderVersion} = 0;
    $self->{glInstanceVersion} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{maxTextureSize} = 64;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLCapabilities::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub isInitialized {
    my ($self) = @_;
        return 1;
}


sub initCapabilities {
    my ($self, $gl) = @_;
}


sub isGlExtensionDrawTexture {
    my ($self) = @_;
        return 0;
}


sub getGlVersion {
    my ($self) = @_;
        return $self->{glVersion};
}


sub isVertexBufferObjectSupport {
    my ($self) = @_;
        return 0;
}


sub isTextureSizeValid {
    my ($self, $widthAndHeight) = @_;
        return 1;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::string::StringUtil ();

1;

