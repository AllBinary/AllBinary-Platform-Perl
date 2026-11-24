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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::java::help::JavaHelpUtil'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{point} = 'java::awt::Point'->new(0, 0);
    $self->{dimension} = 'java::awt::Dimension'->new(640, 480);
    $self->{contextSensitiveHelpActionEvent} = 'java::awt::event::ActionEvent'->new('javax::swing::JLabel'->new(), $java::awt::event::ActionEvent::ACTION_FIRST, undef);
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::help::JavaHelpUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getHelpSet_j1_1 {
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


sub getHelpSet_j1_2 {
    my ($self, $url) = @_;
        try {
            return 'javax::help::HelpSet'->new(undef, $url);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, __PACKAGE__->getInstance(), "set", $e);
            return undef;
        }
}

sub getHelpSet {
    my ($invocant, @arguments) = @_;
    return $invocant->getHelpSet_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getHelpSet takes " . scalar(@arguments) . " arguments";
}

sub getHelpSet_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->getHelpSet_j1_1(@arguments) if 1 && !ref($arguments[0]);
    return $invocant->getHelpSet_j1_2(@arguments);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::awt::Point ();
# use java::awt::Dimension ();
# use java::awt::event::ActionEvent ();
use java::io::File ();
# use java::net::URI ();
# use java::net::URL ();
# use javax::help::CSH ();
# use javax::help::HelpBroker ();
# use javax::help::HelpSet ();
# use javax::swing::JLabel ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();

1;

