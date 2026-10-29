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

package org::allbinary::logic::system::hardware::android::AndroidHardware;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::HardwareInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{componentInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{PROC_BUS_INPUT_DIRECTORY} = "/proc/bus/input/";
    $self->{DEVICES} = $self->{PROC_BUS_INPUT_DIRECTORY} . "devices/";
    $self->{MINHARDWARE} = 3;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($self->{DEVICES});
        my $size = $self->{componentInterfaceVector}->size();
        if ($size < $self->{MINHARDWARE}) {
            die ("Not Enough Data For A Valid License On Linux");
        }
    return $self;
}


# throws Exception
sub init {
    my ($self, $filePath) = @_;
        my $lineNumberReader = $org::allbinary::logic::io::NullCloseable::NULL_CLOSEABLE;
        try {
            $lineNumberReader = $self->get($filePath);
        } catch ($e) {
            $self->{logUtil}->put("Hardware Data: " . $self->toString(), $self, $self->{commonStrings}->{INIT}, $e);
            die $e;
        } finally {
            if (defined($lineNumberReader)) {
                $lineNumberReader->close();
            }
        }
}


# throws Exception
sub get {
    my ($self, $filePath) = @_;
        $self->{componentInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
        my $pciFile = 'java::io::FileReader'->new($filePath);
        my $lineNumberReader = 'java::io::LineNumberReader'->new($pciFile);
        $self->{logUtil}->putF("File Found", $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $nextLine = $lineNumberReader->readLine();
        while (defined($nextLine)) {
            $nextLine = $lineNumberReader->readLine();
            $self->{componentInterfaceVector}->add('org::allbinary::logic::system::hardware::components::android::UnknownHardware'->new($nextLine));
        }
        return $lineNumberReader;
}


sub getComponent {
    my ($self, $index) = @_;
        return $self->{componentInterfaceVector}->get($index);
}


sub toString {
    my ($self) = @_;
        my $stringBuilder = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = $self->{componentInterfaceVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $componentInterface = $self->{componentInterfaceVector}->get($index);
            $stringBuilder->append($componentInterface->toString());
            $stringBuilder->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        }
        return $stringBuilder->toString();
}


sub compareTo {
    my ($self, $hardwareInterface) = @_;
        return 1;
}


sub difference {
    my ($self, $hardwareInterface) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}

# use java::io::Closeable;
# use java::io::FileReader;
# use java::io::LineNumberReader;
use org::allbinary::logic::io::NullCloseable;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::hardware::HardwareInterface;
use org::allbinary::logic::system::hardware::components::android::UnknownHardware;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

