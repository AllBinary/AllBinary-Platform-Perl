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

package org::allbinary::business::context::modules::storefronts::BasicStoreFront;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::modules::storefronts::BasicStoreFrontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{userName} = undef;
    $self->{basketName} = undef;
    $self->{homeHostName} = undef;
    $self->{homeHostNamePath} = undef;
    $self->{hostName} = undef;
    $self->{hostNamePath} = undef;
    $self->{testHomeHostName} = undef;
    $self->{testHomeHostNamePath} = undef;
    $self->{testHostName} = undef;
    $self->{testHostNamePath} = undef;
    $self->{imagePath} = undef;
    $self->{staticPath} = undef;
    $self->{categoryPath} = undef;
    $self->{inventoryControl} = undef;
    $self->{subStores} = undef;
    $self->{tagLocation} = undef;
    $self->{packageLocation} = undef;
    $self->{ftp} = undef;
    $self->{ftpPath} = undef;
    $self->{ftpUserName} = undef;
    $self->{ftpPassword} = undef;
    $self->{testFtp} = undef;
    $self->{testFtpPath} = undef;
    $self->{testFtpUserName} = undef;
    $self->{testFtpPassword} = undef;
    $self->{timeCreated} = undef;
    $self->{lastModified} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicStoreFront takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $storeHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $storeFrontData = 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance();
        $self->{name} = $storeHashMap->get($storeFrontData->{NAME});
        $self->{userName} = $storeHashMap->get($org::allbinary::business::user::UserData::USERNAME);
        $self->{basketName} = $storeHashMap->get($storeFrontData->{NAME});
        $self->{homeHostName} = $storeHashMap->get($storeFrontData->{HOMEHOSTNAME});
        $self->{homeHostNamePath} = $storeHashMap->get($storeFrontData->{HOMEHOSTNAMEPATH});
        $self->{hostName} = $storeHashMap->get($storeFrontData->{HOSTNAME});
        $self->{hostNamePath} = $storeHashMap->get($storeFrontData->{HOSTNAMEPATH});
        $self->{testHomeHostName} = $storeHashMap->get($storeFrontData->{TESTHOMEHOSTNAME});
        $self->{testHomeHostNamePath} = $storeHashMap->get($storeFrontData->{TESTHOMEHOSTNAMEPATH});
        $self->{testHostName} = $storeHashMap->get($storeFrontData->{TESTHOSTNAME});
        $self->{testHostNamePath} = $storeHashMap->get($storeFrontData->{TESTHOSTNAMEPATH});
        $self->{imagePath} = $storeHashMap->get($storeFrontData->{IMAGEPATH});
        $self->{staticPath} = $storeHashMap->get($storeFrontData->{STATICPATH});
        $self->{categoryPath} = $storeHashMap->get($storeFrontData->{CATEGORYPATH});
        $self->{inventoryControl} = $storeHashMap->get($storeFrontData->{INVENTORYCONTROL});
        $self->{subStores} = $storeHashMap->get($storeFrontData->{SUBSTORES});
        $self->{tagLocation} = $storeHashMap->get($storeFrontData->{TAGLOCATION});
        $self->{packageLocation} = $storeHashMap->get($storeFrontData->{PACKAGELOCATION});
        $self->{ftp} = $storeHashMap->get($storeFrontData->{FTP});
        $self->{ftpPath} = $storeHashMap->get($storeFrontData->{FTPPATH});
        $self->{ftpUserName} = $storeHashMap->get($storeFrontData->{FTPUSERNAME});
        $self->{ftpPassword} = $storeHashMap->get($storeFrontData->{FTPPASSWORD});
        $self->{testFtp} = $storeHashMap->get($storeFrontData->{TESTFTP});
        $self->{testFtpPath} = $storeHashMap->get($storeFrontData->{TESTFTPPATH});
        $self->{testFtpUserName} = $storeHashMap->get($storeFrontData->{TESTFTPUSERNAME});
        $self->{testFtpPassword} = $storeHashMap->get($storeFrontData->{TESTFTPPASSWORD});
        $self->{timeCreated} = $storeHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $self->{lastModified} = $storeHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
    return $self;
}


sub getTestHtmlPath {
    my ($self) = @_;
        return $org::allbinary::business::context::modules::storefronts::org::allbinary->{globals}->{URLGLOBALS}->getTestHtmlPath() + $self->getCurrentHostNamePath();
}


sub getCurrentHostName {
    my ($self) = @_;
        my $location = undef;
        if ($org::allbinary::business::context::modules::storefronts::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHostName();
        } else {
            $location = $self->getHostName();
        }
        return $location;
}


sub getCurrentHostNamePath {
    my ($self) = @_;
        my $location = undef;
        if ($org::allbinary::business::context::modules::storefronts::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHostNamePath();
        } else {
            $location = $self->getHostNamePath();
        }
        return $location;
}


sub getCurrentHomeHostName {
    my ($self) = @_;
        my $location = undef;
        if ($org::allbinary::business::context::modules::storefronts::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHomeHostName();
        } else {
            $location = $self->getHomeHostName();
        }
        return $location;
}


sub getCurrentHomeHostNamePath {
    my ($self) = @_;
        my $location = undef;
        if ($org::allbinary::business::context::modules::storefronts::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHomeHostNamePath();
        } else {
            $location = $self->getHomeHostNamePath();
        }
        return $location;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub getBasketName {
    my ($self) = @_;
        return $self->{basketName};
}


sub getHomeHostName {
    my ($self) = @_;
        return $self->{homeHostName};
}


sub getHomeHostNamePath {
    my ($self) = @_;
        return $self->{homeHostNamePath};
}


sub getHostName {
    my ($self) = @_;
        return $self->{hostName};
}


sub getHostNamePath {
    my ($self) = @_;
        return $self->{hostNamePath};
}


sub getTestHomeHostName {
    my ($self) = @_;
        return $self->{testHomeHostName};
}


sub getTestHomeHostNamePath {
    my ($self) = @_;
        return $self->{testHomeHostNamePath};
}


sub getTestHostName {
    my ($self) = @_;
        return $self->{testHostName};
}


sub getTestHostNamePath {
    my ($self) = @_;
        return $self->{testHostNamePath};
}


sub getStaticPath {
    my ($self) = @_;
        return $self->{staticPath};
}


sub getCategoryPath {
    my ($self) = @_;
        return $self->{categoryPath};
}


sub getInventoryControl {
    my ($self) = @_;
        return $self->{inventoryControl};
}


# throws Exception
sub getSubStores {
    my ($self) = @_;
        try {
            my $tokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new('org::allbinary::string::CommonSeps'->getInstance()->{SEMICOLON});
            my $subStoreVector = $tokenizer->getTokensFromString($self->{subStores}, 'org::allbinary::util::BasicArrayListD'->new());
            return $subStoreVector;
        } catch ($e) {
            die $e;
        }
}


sub getTagLocation {
    my ($self) = @_;
        return $self->{tagLocation};
}


sub getPackageLocation {
    my ($self) = @_;
        return $self->{packageLocation};
}


sub getFtp {
    my ($self) = @_;
        return $self->{ftp};
}


sub getFtpUserName {
    my ($self) = @_;
        return $self->{ftpUserName};
}


sub getFtpPassword {
    my ($self) = @_;
        return $self->{ftpPassword};
}


sub getTestFtp {
    my ($self) = @_;
        return $self->{testFtp};
}


sub getTestFtpUserName {
    my ($self) = @_;
        return $self->{testFtpUserName};
}


sub getTestFtpPassword {
    my ($self) = @_;
        return $self->{testFtpPassword};
}


sub getFtpPath {
    my ($self) = @_;
        return $self->{ftpPath};
}


sub getTestFtpPath {
    my ($self) = @_;
        return $self->{testFtpPath};
}


sub getTimeCreated {
    my ($self) = @_;
        return $self->{timeCreated};
}


sub getLastModified {
    my ($self) = @_;
        return $self->{lastModified};
}

use java::util::HashMap;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefronts::BasicStoreFrontInterface;

1;

