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

package org::allbinary::input::automation::robot::InputRobotFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $inputRobotFactory, 'java::lang::LazyStatic', sub { 'org::allbinary::input::automation::robot::InputRobotFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{helpSetListenerInterface} = undef unless exists $self->{helpSetListenerInterface};
}


# throws Exception
sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::automation::robot::InputRobotFactory::inputRobotFactory;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        try {
            my $graphenv = 'java::awt::GraphicsEnvironment'->getLocalGraphicsEnvironment();
            my $screens = $graphenv->getScreenDevices();
            my $inputRobotInterface = undef;
            for (my $i = 0; $i < scalar(@{$screens}); $i++) {
                $inputRobotInterface = 'org::allbinary::input::automation::robot::InputRobot'->new($screens->[$i]);
                $self->{logUtil}->putF("Adding Robot: " . $inputRobotInterface->getName(), $self, "getRobots");
                $self->get()->put($inputRobotInterface->getName(), $inputRobotInterface);
            }
            $self->{logUtil}->putF("Number Of Robots: " . $self->{hashtable}->size(), $self, "getRobots");
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub addListener {
    my ($self, $helpSetListenerInterface) = @_;
        $self->{helpSetListenerInterface} = $helpSetListenerInterface;
}


# throws Exception
sub add {
    my ($self, $inputRobotInterface) = @_;
        $self->{logUtil}->putF("Adding InputRobotInterface: " . $inputRobotInterface->getName(), $self, "add");
        $self->get()->put($inputRobotInterface->getName(), $inputRobotInterface);
        my $helpSet = $inputRobotInterface->getHelpSet();
        if (defined($self->{helpSetListenerInterface})) {
            if (defined($helpSet)) {
                if (!'org::allbinary::logic::java::help::JavaHelpSetNotifier'->isNotified($helpSet)) {
                    my $helpSetEvent = 'javax::help::event::HelpSetEvent'->new($self, $helpSet, $javax::help::event::HelpSetEvent::HELPSET_ADDED);
                    $self->{helpSetListenerInterface}->helpSetAdded($helpSetEvent);
                }
            } else {
                $self->{logUtil}->putF("Null HelpSet For: " . $inputRobotInterface->getName(), $self, "add");
            }
        } else {
            $self->{logUtil}->putF("No HelpSet Listener", $self, "add");
        }
}


# throws Exception
sub loadLibraries_j0 {
    my ($self) = @_;
        my $set = $self->get()->keySet();
        $self->{logUtil}->putF("Loading Libraries", $self, "loadLibraries");
        my $nameArray = $set->toArray();
        my $size = scalar(@{$nameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $inputRobotInterface = 'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get($nameArray->[$index]);
            'org::allbinary::input::automation::robot::InputRobotFactory'->loadLibrary($inputRobotInterface);
        }
}


# throws Exception
sub loadLibraries_j1 {
    my ($class, $collection) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        $logUtil->putF("Loading Libraries", "InputRobotFactory", "loadLibraries");
        my $iterator = $collection->iterator();
        while ($iterator->hasNext()) {
            'org::allbinary::input::automation::robot::InputRobotFactory'->loadLibrary($iterator->next());
        }
}

sub loadLibraries {
    my ($invocant, @arguments) = @_;
    return $invocant->loadLibraries_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->loadLibraries_j1(@arguments) if scalar(@arguments) == 1;
    die "No method loadLibraries takes " . scalar(@arguments) . " arguments";
}


# throws Exception
sub loadLibrary {
    my ($class, $inputRobotInterface) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        if ('org::allbinary::logic::java::anyType::InterfaceUtil'->isImplemented('org::allbinary::logic::system::loader::SecuredNativeLibraryInterface', $inputRobotInterface)) {
            $logUtil->putF("Loading Library: " . $inputRobotInterface->getName(), "InputRobotFactory", "loadLibraries");
            my $securedNativeLibraryInterface = $inputRobotInterface;
            $securedNativeLibraryInterface->load();
        }
}


# throws Exception
sub unloadLibraries {
    my ($self) = @_;
        $self->{logUtil}->putF("Unloading Libraries", $self, "unloadLibraries");
        my $set = $self->get()->keySet();
        my $inputRobotInterface = undef;
        my $inputRobotArray = $set->toArray();
        my $size = scalar(@{$inputRobotArray});
        for (my $index = 0; $index < $size; $index++) {
            $inputRobotInterface = $self->get($inputRobotArray->[$index]);
            if ('org::allbinary::logic::java::anyType::InterfaceUtil'->isImplemented('org::allbinary::logic::system::loader::SecuredNativeLibraryInterface', $inputRobotInterface)) {
                $self->{logUtil}->putF("Unloading Library: " . $inputRobotInterface->getName(), $self, "unloadLibraries");
                my $securedNativeLibraryInterface = $inputRobotInterface;
                $securedNativeLibraryInterface->unload();
            }
        }
}


# throws Exception
sub get_j0 {
    my ($self) = @_;
        return $self->{hashtable};
}


sub get_j1 {
    my ($self, $name) = @_;
        $self->{logUtil}->putF("Getting Robot: " . $name, $self, "getRobots");
        return $self->{hashtable}->get($name);
}

sub get {
    my ($invocant, @arguments) = @_;
    return $invocant->get_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->get_j1(@arguments) if scalar(@arguments) == 1;
    die "No method get takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::awt::GraphicsDevice ();
# use java::awt::GraphicsEnvironment ();
# use java::util::Collection ();
use java::util::Iterator ();
use java::util::Set ();
# use javax::help::HelpSet ();
# use javax::help::event::HelpSetEvent ();
# use javax::help::event::HelpSetListener ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::java::help::JavaHelpSetNotifier ();
use org::allbinary::logic::java::anyType::InterfaceUtil ();
use org::allbinary::logic::system::loader::SecuredNativeLibraryInterface ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::util::ABHashtable ();
use org::allbinary::input::automation::robot::InputRobot ();

1;

