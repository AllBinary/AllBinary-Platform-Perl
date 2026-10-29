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

package org::allbinary::logic::system::hardware::components::linux::Cpu;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::components::interfaces::CpuInterface','org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{CPUFILE} = "/proc/cpuinfo";
    $self->{cpuHashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of Cpu takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $filePath) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($filePath);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($self->{CPUFILE});
    return $self;
}


# throws Exception
sub init {
    my ($self, $filePath) = @_;
        my $lineNumberReader = undef;
        try {
            $self->init($lineNumberReader, $filePath);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
                $self->{logUtil}->put('org::allbinary::logic::string::StringMaker'->new()->append("Cpu Data: ")->append($self->toString())->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            }
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub init {
    my ($self, $lineNumberReader, $filePath) = @_;
        try {
            my $fileReader = 'java::io::FileReader'->new($filePath);
            $lineNumberReader = 'java::io::LineNumberReader'->new($fileReader);
            $self->{cpuHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            if (!defined($lineNumberReader)) {
                my $fileVector = 'org::allbinary::logic::io::file::directory::SubDirectory'->getInstance()->search($filePath, 'org::allbinary::logic::io::file::AbFile'->createAbFile('org::allbinary::logic::io::file::FilePathData'->getInstance()->{PATH_START}));
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Cpu File BasicArrayList Size: ")->appendint($fileVector->size())->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
                }
                if (!$fileVector->isEmpty()) {
                    my $file = $fileVector->get(0);
                    $lineNumberReader = 'java::io::LineNumberReader'->new('java::io::FileReader'->new($file->getPath()));
                }
            }
            if (defined($lineNumberReader)) {
                my $nextLine = $lineNumberReader->readLine();
                while (defined($lineNumberReader) && defined($nextLine)) {
                    my $index = index($nextLine, ":");
                    if ($index >= 0) {
                        my $key = substr($nextLine, 0, ($index) - (0));
                        my $valueIndex = $index + 1;
                        my $value = substr($nextLine, $valueIndex, (length($nextLine)) - ($valueIndex));
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::PROCESSOR->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::PROCESSOR, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::VENDORID->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::VENDORID, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUFAMILY->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUFAMILY, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODEL->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODEL, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODELNAME->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODELNAME, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::STEPPING->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::STEPPING, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUMHZ->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUMHZ, $value);
                        }
                        if (index($key, $org::allbinary::logic::system::hardware::components::linux::CpuInfo::CACHESIZE->toString()) >= 0) {
                            $self->{cpuHashMap}->put($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CACHESIZE, $value);
                        }
                    }
                    $nextLine = $lineNumberReader->readLine();
                }
            }
        } catch ($exception) { die $exception; } finally {
            if (defined($lineNumberReader)) {
                $lineNumberReader->close();
            }
        }
}


sub getProcessor {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::PROCESSOR);
}


sub getVendorId {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::VENDORID);
}


sub getCpuFamily {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUFAMILY);
}


sub getModel {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODEL);
}


sub getModelName {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODELNAME);
}


sub getStepping {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::STEPPING);
}


sub getCpuSpeed {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUMHZ);
}


sub getCacheSize {
    my ($self) = @_;
        return $self->{cpuHashMap}->get($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CACHESIZE);
}


sub compareTo {
    my ($self, $cpuInterface) = @_;
        return 1;
}


# Java overloaded method: Perl keeps the last definition
sub compareTo {
    my ($self, $componentInterface) = @_;
        return 1;
}


sub toString {
    my ($self) = @_;
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::PROCESSOR->toString())->append($commonLabels->{COLON_SEP})->append($self->getProcessor());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::VENDORID->toString())->append($commonLabels->{COLON_SEP})->append($self->getVendorId());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUFAMILY->toString())->append($commonLabels->{COLON_SEP})->append($self->getCpuFamily());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODEL->toString())->append($commonLabels->{COLON_SEP})->append($self->getModel());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::MODELNAME->toString())->append($commonLabels->{COLON_SEP})->append($self->getModelName());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::STEPPING->toString())->append($commonLabels->{COLON_SEP})->append($self->getStepping());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CPUMHZ->toString())->append($commonLabels->{COLON_SEP})->append($self->getCpuSpeed());
        $stringMaker->append($commonSeps->{NEW_LINE});
        $stringMaker->append($org::allbinary::logic::system::hardware::components::linux::CpuInfo::CACHESIZE->toString())->append($commonLabels->{COLON_SEP})->append($self->getCacheSize());
        return $stringMaker->toString();
}

# use java::io::FileReader;
# use java::io::LineNumberReader;
use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::io::file::directory::SubDirectory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::hardware::components::interfaces::CpuInterface;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::system::hardware::components::linux::CpuInfo;

1;

