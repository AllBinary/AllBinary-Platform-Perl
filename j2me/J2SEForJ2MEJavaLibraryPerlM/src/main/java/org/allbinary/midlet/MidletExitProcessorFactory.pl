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

package org::allbinary::midlet::MidletExitProcessorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::midlet::MidletExitProcessorFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::midlet::MidletExitProcessorFactory::instance;
}


sub getExitInstance {
    my ($self, $midlet) = @_;
        if ('org::allbinary::AppletUtil'->isAppletLoader($midlet) || 'org::allbinary::J2MEUtil'->isJ2ME()) {
            return 'org::allbinary::canvas::Processor'->getInstance();
        } else {
            return 'org::allbinary::midlet::MidletExitProcessor'->new($midlet);
        }
}

# use javax::microedition::midlet::MIDlet;
use org::allbinary::AppletUtil;
use org::allbinary::J2MEUtil;
use org::allbinary::canvas::Processor;
use org::allbinary::midlet::MidletExitProcessor;

1;

