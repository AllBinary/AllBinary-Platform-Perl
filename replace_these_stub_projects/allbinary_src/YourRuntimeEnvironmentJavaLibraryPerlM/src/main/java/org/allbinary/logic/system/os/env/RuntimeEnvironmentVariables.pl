# Generated Code Do Not Modify

package org::allbinary::logic::system::os::env::RuntimeEnvironmentVariables;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getTest1 {
    my ($self) = @_;
        return 'java::lang::System'->getProperty("java.java.home");
}


sub getVariable {
    my ($self, $var) = @_;
        my $environmentVariables = $self->get();
        return $environmentVariables->getProperty($var);
}


sub get {
    my ($self) = @_;
        try {
            my $process = undef;
            my $environmentVariables = 'java::util::Properties'->new();
            my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
            my $osName = $operatingSystemInterface->getName();
            my $linuxCommand = "env";
            my $windowsCommand = "cmd.exe /c set";
            my $solarisCommand = $linuxCommand;
            my $operatingSystems = 'org::allbinary::logic::system::os::OperatingSystems'->getInstance();
            if (($osName cmp $operatingSystems->{LINUX}) == 0) {
                $process = 'java::lang::Runtime'->getRuntime()->exec($linuxCommand);
            } elsif (index($osName, $operatingSystems->{WINDOWS}) >= 0) {
                $process = 'java::lang::Runtime'->getRuntime()->exec($windowsCommand);
            } elsif (($osName cmp $operatingSystems->{SOLARIS}) == 0) {
                $process = 'java::lang::Runtime'->getRuntime()->exec($solarisCommand);
            } else {
                die ("Exception");
            }
            my $processInputStreamReader = 'java::io::InputStreamReader'->new($process->getInputStream());
            my $bufferedReader = 'java::io::BufferedReader'->new($processInputStreamReader);
            my $keyValuePair = undef;
            while (defined((($keyValuePair = $bufferedReader->readLine())))) {
                my $index = index($keyValuePair, "=");
                my $key = substr($keyValuePair, 0, ($index) - (0));
                my $value = substr($keyValuePair, $index + 1);
                $environmentVariables->put($key, $value);
            }
            return $environmentVariables;
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "get()", $e);
            }
            return undef;
        }
}


sub getTempDir {
    my ($self) = @_;
        try {
            return 'java::lang::System'->getProperty("java.io.tmpdir");
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getTempDir()", $e);
            }
            return undef;
        }
}


sub getLibraryPath {
    my ($self) = @_;
        try {
            return 'java::lang::System'->getProperty("java.library.path");
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getLibraryPath()", $e);
            }
            return undef;
        }
}


sub getClassPath {
    my ($self) = @_;
        try {
            return 'java::lang::System'->getProperty("java.class.path");
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getClassPath()", $e);
            }
            return undef;
        }
}


sub updateLibraryPath {
    my ($self, $libPath) = @_;
        try {
            my $existingPath = $self->getLibraryPath();
            'java::lang::System'->setProperty("java.library.path", $libPath . ":" . $existingPath);
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updateLibraryPath()", $e);
            }
        }
}


sub getUserHome {
    my ($self) = @_;
        try {
            return 'java::lang::System'->getProperty("user.home");
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getUserHome()", $e);
            }
            return undef;
        }
}


sub getUserDir {
    my ($self) = @_;
        try {
            return 'java::lang::System'->getProperty("user.dir");
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getUserDir()", $e);
            }
            return undef;
        }
}


sub set {
    my ($self) = @_;
        try {
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "get()", $e);
            }
        }
}


sub setVariable {
    my ($self, $var, $val) = @_;
        try {
            my $process = undef;
            my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
            my $operatingSystems = 'org::allbinary::logic::system::os::OperatingSystems'->getInstance();
            my $osName = $operatingSystemInterface->getName();
            my $windowsCommand = "cmd.exe /c set" . $var . "=" . $val;
            if (($osName cmp $operatingSystems->{LINUX}) == 0) {
                die ("Exception");
            } elsif (index($osName, $operatingSystems->{WINDOWS}) >= 0) {
                $process = 'java::lang::Runtime'->getRuntime()->exec($windowsCommand);
            } elsif (($osName cmp $operatingSystems->{SOLARIS}) == 0) {
                die ("Exception");
            } else {
                die ("Exception");
            }
        } catch ($e) {
            if ($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::os::env::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{OSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setVariable()", $e);
            }
        }
}

# use java::io::BufferedReader;
# use java::io::InputStreamReader;
# use java::util::Properties;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::logic::system::os::OperatingSystems;
use org::allbinary::string::CommonStrings;
use java::lang::System;
use java::lang::Runtime;

1;

