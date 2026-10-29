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

package org::allbinary::logic::java::help::JavaHelpUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::java::help::JavaHelpUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{point} = 'org::allbinary::logic::java::help::Point'->new(0, 0);
    $self->{dimension} = 'org::allbinary::logic::java::help::Dimension'->new(640, 480);
    $self->{contextSensitiveHelpActionEvent} = 'java::awt::event::ActionEvent'->new('org::allbinary::logic::java::help::JLabel'->new(), $java::awt::event::ActionEvent::ACTION_FIRST, undef);
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::help::JavaHelpUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getHelpSet {
    my ($self, $filePath) = @_;
        try {
            my $helpSetURI = 'java::io::File'->new($filePath)->toURI();
            my $helpSetURL = $helpSetURI->toURL();
            return $self->getHelpSet($helpSetURL);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, __PACKAGE__->getInstance(), "set", $e);
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getHelpSet {
    my ($self, $url) = @_;
        try {
            return 'javax::help::HelpSet'->new(undef, $url);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, __PACKAGE__->getInstance(), "set", $e);
            return undef;
        }
}


sub show {
    my ($self, $helpSet) = @_;
        try {
            my $helpBroker = $helpSet->createHelpBroker();
            $helpBroker->setLocation($self->{point});
            $helpBroker->setSize($self->{dimension});
            'CSH::DisplayHelpFromSource'->new($helpBroker)->actionPerformed($self->{contextSensitiveHelpActionEvent});
            $self->{logUtil}->putF("CSH Action", __PACKAGE__->getInstance(), "show");
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, __PACKAGE__->getInstance(), "show", $e);
        }
}


sub main {
    my ($class, $args) = @_;
        try {
            my $javaHelpUtil = 'org::allbinary::logic::java::help::JavaHelpUtil'->getInstance();
            $javaHelpUtil->show($javaHelpUtil->getHelpSet("G:/mnt/bc/mydev/working/automation/InputAutomationJavaApplication/AllBinaryInputAutomationHelp/AllBinaryInputAutomation.hs"));
        } catch ($e) {
        }
}

# use java::awt;
# use java::awt::event::ActionEvent;
use java::io::File;
# use java::net::URI;
# use java::net::URL;
# use javax::help::CSH;
# use javax::help::HelpBroker;
# use javax::help::HelpSet;
# use javax::swing;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::java::help::Point;
use org::allbinary::logic::java::help::Dimension;
use org::allbinary::logic::java::help::JLabel;

1;

