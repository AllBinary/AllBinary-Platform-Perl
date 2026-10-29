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

package org::allbinary::logic::system::security::licensing::LicenseClientAndServerTest;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{vector} = 'org::allbinary::logic::system::security::licensing::BasicArrayListD'->new();
}


sub new {
    my ($class, $options) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->setFilePath($org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo::PATH + 'org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH});
        for (my $index = 1; $index < scalar(@{$options}); $index++) {
            $self->{vector}->add($options->[$index]);
        }
        if (scalar(@{$options}) < 2) {
            my $file = 'java::io::File'->new($org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo::PATH . "testlicenseservers.txt");
            my $reader = 'java::io::FileReader'->new($file);
            my $lineNumberReader = 'java::io::LineNumberReader'->new($reader);
            while (1) {
                my $line = $lineNumberReader->readLine();
                if (defined($line)) {
                    $self->{vector}->add($line);
                } else {
                    last;
                }
            }
        }
    return $self;
}


sub test {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        try {
            my $list = 'org::allbinary::logic::system::security::licensing::BasicArrayListD'->new();
            my $TESTING = "Testing with new licence:<br/>";
            my $PROCESSING = "Processing: <br/>";
            my $END = "<br/>End<br/>";
            my $RESULT = "Test Result: ";
            my $size = $self->{vector}->size();
            for (my $index = 0; $index < $size; $index++) {
                $stringBuffer->append($TESTING);
                my $serverName = $self->{vector}->get($index);
                try {
                    my $licenseInitInfo = 'org::allbinary::business::init::LicenseInitInfo'->new();
                    $licenseInitInfo->addServer($serverName);
                    'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->write($licenseInitInfo);
                    my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::AbeClientInformationInterfaceFactory'->getInstance();
                    my $xmlRpcAbeLicenseClient = 'org::allbinary::logic::system::security::licensing::client::XmlRpcAbeLicenseRetrievalClient'->new($abeClientInformation);
                    my $abeLicenseInterface = $xmlRpcAbeLicenseClient->get(undef);
                    if (defined($abeLicenseInterface)) {
                        $stringBuffer->append($PROCESSING);
                        $stringBuffer->append($abeLicenseInterface->toString());
                    }
                    $stringBuffer->append($END);
                    $self->{logUtil}->putF($RESULT . $stringBuffer->toString(), $self, "test");
                    $stringBuffer->delete(0, $stringBuffer->length());
                } catch ($e) {
                    $list->add($serverName);
                    $self->{logUtil}->put("Test Error: " . $stringBuffer->toString(), $self, "test", $e);
                }
            }
            $self->{logUtil}->putF("Total Servers Failed: " . $list->size() . " Failed Servers: " . $list->toString(), $self, "test");
        } catch ($e) {
            $self->{logUtil}->put("Test Error: " . $stringBuffer->toString(), $self, "test", $e);
        }
}


sub main {
    my ($class, $args) = @_;
        try {
            my $licensingTest = 'org::allbinary::logic::system::security::licensing::LicenseClientAndServerTest'->new($args);
            $licensingTest->test();
        } catch ($e) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, "main()", "main()", $e);
        }
}

use java::io::File;
# use java::io::FileReader;
# use java::io::LineNumberReader;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::business::init::LicenseInitInfo;
use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::client::XmlRpcAbeLicenseRetrievalClient;
use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::system::security::licensing::BasicArrayListD;
use org::allbinary::logic::system::security::licensing::PrintLicenseInitInfo;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterfaceFactory;

1;

