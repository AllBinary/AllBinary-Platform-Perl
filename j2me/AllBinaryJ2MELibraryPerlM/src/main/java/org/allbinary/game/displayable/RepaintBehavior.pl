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

package org::allbinary::game::displayable::RepaintBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::displayable::RepaintBehavior'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{NAME} = "RepaintBehavior";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::RepaintBehavior::instance;
}


sub repaint {
    my ($self, $canvas) = @_;
}


sub onChangeRepaint {
    my ($self, $canvas) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        if ($features->isFeature($openGLFeatureFactory->{OPENGL})) {
            'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->process();
        } else {
            my $thread = 'java::lang::Thread'->new('org::allbinary::game::displayable::RepaintRunnable'->new($canvas), $self->{NAME});
            $thread->start();
        }
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Canvas ();
use org::allbinary::game::configuration::feature::Features ();
use org::allbinary::graphics::displayable::DisplayInfoSingleton ();
use org::allbinary::graphics::opengles::OpenGLFeatureFactory ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::thread::NullRunnable ();
use java::lang::Thread ();
use org::allbinary::game::displayable::RepaintRunnable ();

1;

