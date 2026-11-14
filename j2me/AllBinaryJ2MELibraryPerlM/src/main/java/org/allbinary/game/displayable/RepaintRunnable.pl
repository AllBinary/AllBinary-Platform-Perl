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

package org::allbinary::game::displayable::RepaintRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::ARunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{canvas} = undef;
}


sub new {
    my ($class, $canvas) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{canvas} = $canvas;
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->{canvas}->repaint();
            'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->process();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use java::lang::Object ();
use javax::microedition::lcdui::Canvas ();
use org::allbinary::graphics::displayable::DisplayInfoSingleton ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::thread::ARunnable ();

1;

