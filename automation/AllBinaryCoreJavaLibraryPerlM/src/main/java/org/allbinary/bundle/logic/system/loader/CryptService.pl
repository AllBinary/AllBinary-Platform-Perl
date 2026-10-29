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

package org::allbinary::bundle::logic::system::loader::CryptService;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{abCryptUtil} = 'org::allbinary::logic::system::security::AbCryptUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::globals::Globals'->getInstance()->init(ref($self)->getClassLoader(), "./");
        $self->{logUtil}->putF("Set Globals: " . 'org::allbinary::globals::URLGLOBALS'->getWebappPath(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub getDecryptedInputStream {
    my ($self, $abeClientInformation, $name, $inputStream) = @_;
        try {
            my $key = 'org::allbinary::logic::system::security::AbKeys'->getInstance()->getKey($abeClientInformation, $name);
            my $decrypted = $self->{abCryptUtil}->decrypt($inputStream, $key);
            return 'java::io::ByteArrayInputStream'->new($decrypted);
        } catch ($e) {
            $self->showLicenseDialog($abeClientInformation, $e);
        }
        return undef;
}


sub showLicenseDialog {
    my ($self, $abeClientInformation, $e) = @_;
        try {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
            my $basicTextJDialog = 'org::allbinary::gui::dialog::BasicTextJDialog'->new(("" . $e));
            try {
                my $abeLicenseInterface = 'org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory'->getInstance()->getLicenseInstance($abeClientInformation);
                if ($abeLicenseInterface != 'org::allbinary::logic::system::security::licensing::AbeNoLicense'->getInstance()) {
                    if ($abeLicenseInterface->isValid()) {
                        $basicTextJDialog->setText("Subscription Invalid");
                    }
                }
            } catch ($e2) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e2);
            }
            $basicTextJDialog->addCloseListener('org::allbinary::gui::dialog::ExitCloseListener'->new());
            $basicTextJDialog->setVisible(1);
        } catch ($e3) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e3);
        }
}

# use java::io::ByteArrayInputStream;
# use java::io::InputStream;
use org::allbinary::globals::Globals;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::gui::dialog::BasicTextJDialog;
use org::allbinary::gui::dialog::ExitCloseListener;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::AbCryptUtil;
use org::allbinary::logic::system::security::AbKeys;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::AbeLicenseInterface;
use org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory;
use org::allbinary::logic::system::security::licensing::AbeNoLicense;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;

1;

