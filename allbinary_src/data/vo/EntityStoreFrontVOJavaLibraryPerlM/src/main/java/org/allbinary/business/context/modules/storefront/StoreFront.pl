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

package org::allbinary::business::context::modules::storefront::StoreFront;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::modules::storefront::StoreFrontInterface';

our $RESOURCES = " Resources" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{abPathUtil} = 'org::allbinary::logic::io::path::AbPathUtil'->getInstance();
    $self->{name} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{basketName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{homeHostName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{homeHostNamePath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{hostName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{hostNamePath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{testHomeHostName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{testHomeHostNamePath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{testHostName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{testHostNamePath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{imagePath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{staticPath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{categoryPath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{inventoryControl} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{contextConfigurationInterface} = undef;
    $self->{subStores} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{tagLocation} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{packageLocation} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{ftp} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{ftpPath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{ftpUserName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{ftpPassword} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{testFtp} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{testFtpPath} = $self->{abPathUtil}->{NO_ABPATH};
    $self->{testFtpUserName} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{testFtpPassword} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{timeCreated} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{lastModified} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{MINCHAR} = 0;
    $self->{MINSTORENAMELENGTH} = 1;
    $self->{MAXCHAR} = 255;
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{ONE_EMPTY_STRING_ARRAY} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{ONE_EMPTY_STRING_ARRAY};
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of StoreFront takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{contextConfigurationInterface} = 'org::allbinary::business::context::configuration::ContextConfiguration'->new();
    return $self;
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData('org::allbinary::logic::communication::http::request::RequestParams'->new($request)->toHashMap());
        if ($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF("TWB- needs update for adding and updating context configuration - currently defaults to admin context config", $self, "StoreFront");
        }
        $self->setContextConfigurationInterface('org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory'->getInstance()->getInstance("Admin"));
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData($hashMap);
        my $domDocumentString = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{CONFIGURATION});
        if (!defined($domDocumentString)) {
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($domDocumentString);
            $self->setContextConfigurationInterface('org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory'->getInstance()->getInstance($document));
        }
    return $self;
}


sub isColumn {
    my ($self, $columnName) = @_;
        if (($columnName cmp 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}) == 0 || ($columnName cmp $org::allbinary::business::user::UserData::MAINEMAIL) == 0) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub createPath {
    my ($self, $key, $hashMap) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new($self->create($self->{EMPTY_STRING}, $key, $hashMap), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub createPath {
    my ($self, $append, $key, $hashMap) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new($self->create($append, $key, $hashMap), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub get {
    my ($self, $key, $hashMap) = @_;
        return $self->create($self->{EMPTY_STRING}, $key, $hashMap);
}


sub create {
    my ($self, $append, $key, $hashMap) = @_;
        my $path = $hashMap->get($key);
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($path)) {
            return $self->{EMPTY_STRING};
        } else {
            if ($self->isColumn($path)) {
                return $hashMap->get($path) . $append;
            } else {
                return $path;
            }
        }
}


# throws Exception
sub getFormData {
    my ($self, $storeHashMap) = @_;
        my $storeFrontData = 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance();
        $self->{name} = $storeHashMap->get($storeFrontData->{NAME});
        $self->{basketName} = $storeHashMap->get($storeFrontData->{NAME});
        $self->{homeHostName} = $storeHashMap->get($storeFrontData->{HOMEHOSTNAME});
        $self->{homeHostNamePath} = $self->createPath($storeFrontData->{HOMEHOSTNAMEPATH}, $storeHashMap);
        $self->{hostName} = $storeHashMap->get($storeFrontData->{HOSTNAME});
        $self->{hostNamePath} = $self->createPath($storeFrontData->{HOSTNAMEPATH}, $storeHashMap);
        $self->{testHomeHostName} = $storeHashMap->get($storeFrontData->{TESTHOMEHOSTNAME});
        $self->{testHomeHostNamePath} = $self->createPath($storeFrontData->{TESTHOMEHOSTNAMEPATH}, $storeHashMap);
        $self->{testHostName} = $storeHashMap->get($storeFrontData->{TESTHOSTNAME});
        $self->{testHostNamePath} = $self->createPath($storeFrontData->{TESTHOSTNAMEPATH}, $storeHashMap);
        $self->{imagePath} = $self->createPath($org::allbinary::business::context::modules::storefront::StoreFront::RESOURCES, $storeFrontData->{IMAGEPATH}, $storeHashMap);
        $self->{staticPath} = $self->createPath(" Products" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR}, $storeFrontData->{STATICPATH}, $storeHashMap);
        $self->{categoryPath} = $self->createPath($org::allbinary::business::context::modules::storefront::StoreFront::RESOURCES, $storeFrontData->{CATEGORYPATH}, $storeHashMap);
        $self->{inventoryControl} = $storeHashMap->get($storeFrontData->{INVENTORYCONTROL});
        $self->{subStores} = $storeHashMap->get($storeFrontData->{SUBSTORES});
        $self->{tagLocation} = $storeHashMap->get($storeFrontData->{TAGLOCATION});
        $self->{packageLocation} = $storeHashMap->get($storeFrontData->{PACKAGELOCATION});
        $self->{ftp} = $storeHashMap->get($storeFrontData->{FTP});
        $self->{ftpPath} = $self->createPath($storeFrontData->{FTPPATH}, $storeHashMap);
        $self->{ftpUserName} = $storeHashMap->get($storeFrontData->{FTPUSERNAME});
        $self->{ftpPassword} = $storeHashMap->get($storeFrontData->{FTPPASSWORD});
        $self->{testFtp} = $storeHashMap->get($storeFrontData->{TESTFTP});
        $self->{testFtpPath} = $self->createPath($storeFrontData->{TESTFTPPATH}, $storeHashMap);
        $self->{testFtpUserName} = $storeHashMap->get($storeFrontData->{TESTFTPUSERNAME});
        $self->{testFtpPassword} = $storeHashMap->get($storeFrontData->{TESTFTPPASSWORD});
        $self->{timeCreated} = $storeHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $self->{lastModified} = $storeHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
}


sub isNameValid {
    my ($self) = @_;
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{name}, $self->{MINSTORENAMELENGTH}, $self->{MAXCHAR})) {
            return 0;
        } else {
            my $isEscapedCharactersContained = 0;
            my $storeNameEscaped = 'org::apache::commons::lang3::StringEscapeUtils'->escapeHtml3($self->{name});
            if (($self->{name} cmp $storeNameEscaped) != 0) {
                $isEscapedCharactersContained = 1;
            }
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            my $isSpacesContained = 0;
            if ($stringValidationUtil->containsSpaces($self->{name})) {
                $isSpacesContained = 1;
            }
            if ($isSpacesContained || $isEscapedCharactersContained) {
                my $hashMap = 'org::allbinary::logic::string::SpecialCharacterUtil'->getHashMap();
                $hashMap->put(['org::allbinary::string::CommonSeps'->getInstance()->{SPACE}], $self->{ONE_EMPTY_STRING_ARRAY});
                $self->{name} = 'org::allbinary::logic::string::regex::replace::Replace'->new($hashMap)->all($self->{name});
            }
        }
        return 1;
}


sub isValid {
    my ($self) = @_;
        my $valid = 1;
        $valid = $self->isNameValid();
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->{basketName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{homeHostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{homeHostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{hostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{hostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testHomeHostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testHomeHostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testHostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testHostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{imagePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{staticPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{categoryPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{inventoryControl}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{subStores}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{tagLocation}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidRequired($self->{packageLocation}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{ftp}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{ftpPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{ftpUserName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{ftpPassword}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testFtp}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testFtpPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testFtpUserName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if (!$stringValidationUtil->isValidNotRequired($self->{testFtpPassword}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            $valid = 0;
        }
        if ($valid == 1) {
            return 1;
        } else {
            return 0;
        }
}


sub nameValidationInfo {
    my ($self) = @_;
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->{name}, $self->{MINCHAR}, $self->{MAXCHAR})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Name is invalid. Must be < ");
            $stringBuffer->appendint($self->{MAXCHAR});
            $stringBuffer->append(" and > 0 characters.<br>");
            return $stringBuffer->toString();
        }
        return $self->{EMPTY_STRING};
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->nameValidationInfo());
            if (!$stringValidationUtil->isValidRequired($self->{basketName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Basket name is invalid. Must be < ");
                $stringBuffer->appendint($self->{MAXCHAR});
                $stringBuffer->append(" and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{homeHostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Home host name is invalid. Must be < ");
                $stringBuffer->appendint($self->{MAXCHAR});
                $stringBuffer->append(" and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{homeHostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Home host name path is invalid. Must be < ");
                $stringBuffer->appendint($self->{MAXCHAR});
                $stringBuffer->append(" and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{hostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Host name is invalid. Must be < ");
                $stringBuffer->appendint($self->{MAXCHAR});
                $stringBuffer->append(" and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{hostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Host name path is invalid. Must be < ");
                $stringBuffer->appendint($self->{MAXCHAR});
                $stringBuffer->append(" and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testHomeHostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test home host name is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testHomeHostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test home host name path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testHostName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test host name is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testHostNamePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test host name path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{imagePath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Image path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{staticPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Static path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{categoryPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Category path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{inventoryControl}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Inventory control is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{subStores}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Sub stores is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{tagLocation}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Tag location is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidRequired($self->{packageLocation}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Package location is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{ftp}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Ftp is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{ftpPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Ftp path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{ftpUserName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Ftp username is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{ftpPassword}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Ftp password is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testFtp}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test ftp is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testFtpPath}->toString(), $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test ftp Path is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testFtpUserName}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test ftp username is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            if (!$stringValidationUtil->isValidNotRequired($self->{testFtpPassword}, $self->{MINCHAR}, $self->{MAXCHAR})) {
                $stringBuffer->append("Test ftp password is invalid. Must be < " . $self->{MAXCHAR} . " and > 0 characters.<br>");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
        }
}


sub getTestHtmlPath {
    my ($self) = @_;
        return $org::allbinary::business::context::modules::storefront::org::allbinary->{globals}->{URLGLOBALS}->getTestHtmlPath() + $self->getCurrentHostNamePath();
}


sub getCurrentHostName {
    my ($self) = @_;
        my $location = $self->{EMPTY_STRING};
        if ($org::allbinary::business::context::modules::storefront::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHostName();
        } else {
            $location = $self->getHostName();
        }
        return $location;
}


sub getCurrentHostNamePath {
    my ($self) = @_;
        my $location = $self->{EMPTY_STRING};
        if ($org::allbinary::business::context::modules::storefront::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHostNamePath();
        } else {
            $location = $self->getHostNamePath();
        }
        return $location;
}


sub getCurrentHomeHostName {
    my ($self) = @_;
        my $location = $self->{EMPTY_STRING};
        if ($org::allbinary::business::context::modules::storefront::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
            $location = $self->getTestHomeHostName();
        } else {
            $location = $self->getHomeHostName();
        }
        return $location;
}


sub getCurrentHomeHostNamePath {
    my ($self) = @_;
        my $location = $self->{EMPTY_STRING};
        if ($org::allbinary::business::context::modules::storefront::org::allbinary->{globals}->{URLGLOBALS}->isTestingMode()) {
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
        return $self->{homeHostNamePath}->toString();
}


sub getHostName {
    my ($self) = @_;
        return $self->{hostName};
}


sub getHostNamePath {
    my ($self) = @_;
        return $self->{hostNamePath}->toString();
}


sub getTestHomeHostName {
    my ($self) = @_;
        return $self->{testHomeHostName};
}


sub getTestHomeHostNamePath {
    my ($self) = @_;
        return $self->{testHomeHostNamePath}->toString();
}


sub getTestHostName {
    my ($self) = @_;
        return $self->{testHostName};
}


sub getTestHostNamePath {
    my ($self) = @_;
        return $self->{testHostNamePath}->toString();
}


sub getStaticPath {
    my ($self) = @_;
        return $self->{staticPath}->toString();
}


sub getCategoryPath {
    my ($self) = @_;
        return $self->{categoryPath}->toString();
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
        return $self->{ftpPath}->toString();
}


sub getTestFtpPath {
    my ($self) = @_;
        return $self->{testFtpPath}->toString();
}


sub getTimeCreated {
    my ($self) = @_;
        return $self->{timeCreated};
}


sub getLastModified {
    my ($self) = @_;
        return $self->{lastModified};
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setBasketName {
    my ($self, $value) = @_;
        $self->{basketName} = $value;
}


sub setHomeHostName {
    my ($self, $value) = @_;
        $self->{homeHostName} = $value;
}


# throws Exception
sub setHomeHostNamePath {
    my ($self, $value) = @_;
        $self->{homeHostNamePath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub setHostName {
    my ($self, $value) = @_;
        $self->{hostName} = $value;
}


# throws Exception
sub setHostNamePath {
    my ($self, $value) = @_;
        $self->{hostNamePath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub setTestHomeHostName {
    my ($self, $value) = @_;
        $self->{testHomeHostName} = $value;
}


# throws Exception
sub setTestHomeHostNamePath {
    my ($self, $value) = @_;
        $self->{testHomeHostNamePath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub setTestHostName {
    my ($self, $value) = @_;
        $self->{testHostName} = $value;
}


# throws Exception
sub setTestHostNamePath {
    my ($self, $value) = @_;
        $self->{testHostNamePath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
sub setImagePath {
    my ($self, $value) = @_;
        $self->{imagePath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
sub setStaticPath {
    my ($self, $value) = @_;
        $self->{staticPath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
sub setCategoryPath {
    my ($self, $value) = @_;
        $self->{categoryPath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


sub setSubStores {
    my ($self, $value) = @_;
        $self->{subStores} = $value;
}


sub setTagLocation {
    my ($self, $value) = @_;
        $self->{tagLocation} = $value;
}


sub setPackageLocation {
    my ($self, $value) = @_;
        $self->{packageLocation} = $value;
}


sub setInventoryControl {
    my ($self, $value) = @_;
        $self->{inventoryControl} = $value;
}


# Java overloaded method: Perl keeps the last definition
sub getPackageLocation {
    my ($self, $value) = @_;
        $self->{packageLocation} = $value;
}


sub setFtp {
    my ($self, $value) = @_;
        $self->{ftp} = $value;
}


sub setFtpUserName {
    my ($self, $value) = @_;
        $self->{ftpUserName} = $value;
}


sub setFtpPassword {
    my ($self, $value) = @_;
        $self->{ftpPassword} = $value;
}


sub setTestFtp {
    my ($self, $value) = @_;
        $self->{testFtp} = $value;
}


sub setTestFtpUserName {
    my ($self, $value) = @_;
        $self->{testFtpUserName} = $value;
}


sub setTestFtpPassword {
    my ($self, $value) = @_;
        $self->{testFtpPassword} = $value;
}


sub setTimeCreated {
    my ($self, $value) = @_;
        $self->{timeCreated} = $value;
}


sub setLastModified {
    my ($self, $value) = @_;
        $self->{lastModified} = $value;
}


# throws Exception
sub setFtpPath {
    my ($self, $value) = @_;
        $self->{ftpPath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
sub setTestFtpPath {
    my ($self, $value) = @_;
        $self->{testFtpPath} = 'org::allbinary::logic::io::path::AbPath'->new($value, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}


# throws Exception
sub createDirectories {
    my ($self) = @_;
        my $storeAbPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() + $self->getCurrentHomeHostNamePath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        if (!$self->{directory}->create($storeAbPath)) {
            return 0;
        }
        if (!$self->{directory}->create('org::allbinary::logic::io::path::AbPath'->new($storeAbPath + $self->getCategoryPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}))) {
            return 0;
        }
        if (!$self->{directory}->create('org::allbinary::logic::io::path::AbPath'->new($storeAbPath + $self->getStaticPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}))) {
            return 0;
        }
        return 1;
}


# throws Exception
sub install {
    my ($self, $current, $total) = @_;
        try {
            if (!$self->createDirectories()) {
                die ("Unable to create store directories");
            }
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
            $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
            my $viewPath = $stringBuffer->toString();
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($viewPath);
            $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{INSTALLPATH});
            my $fromDirectoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($viewPath);
            $stringBuffer->append("special");
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
            my $fromSpecialDirectoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($viewPath);
            $stringBuffer->append($self->getName());
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
            my $toDirectoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            if ($current == 0) {
                if (!$self->{directory}->create($toDirectoryAbPath)) {
                    die ("Unable to create store view directory: " . $toDirectoryAbPath->toString());
                }
            }
            my $viewTotal = int(($total * 85) / 100);
            my $installTotal = int(($total * 93) / 100);
            if ($current < $viewTotal) {
                my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($fromSpecialDirectoryAbPath);
                if ($file->isDirectory()) {
                    my $halfViewTotal = int($viewTotal / 2);
                    if ($current < $halfViewTotal) {
                        $self->installViews($fromSpecialDirectoryAbPath, $toDirectoryAbPath, $current, $halfViewTotal);
                    } elsif ($current < $viewTotal) {
                        $self->installViews($fromDirectoryAbPath, $toDirectoryAbPath, $current - $halfViewTotal, $viewTotal - $halfViewTotal);
                    }
                } else {
                    $self->installViews($fromDirectoryAbPath, $toDirectoryAbPath, $current, $viewTotal);
                }
            } elsif ($current < $installTotal) {
                $self->installResources($fromDirectoryAbPath, $current - $viewTotal, $installTotal - $viewTotal);
            } else {
                $self->installMedia($fromDirectoryAbPath, $current - $installTotal, $total - $installTotal);
            }
        } catch ($e) {
            if ($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "install()", $e);
            }
            die $e;
        }
}


# throws Exception
sub installViews {
    my ($self, $fromDirectoryAbPath, $toDirectoryAbPath, $current, $total) = @_;
        'org::allbinary::logic::io::file::FileUtil'->getInstance()->copyDirectoryPortion($fromDirectoryAbPath, $toDirectoryAbPath, 1, 0, $current, $total);
}


# throws Exception
sub installResources {
    my ($self, $fromDirectoryAbPath, $current, $total) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($fromDirectoryAbPath->toString());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append("Resources");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        my $installCategoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append($self->getCurrentHomeHostNamePath());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append($self->getCategoryPath());
        my $categoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        'org::allbinary::logic::io::file::FileUtil'->getInstance()->copyDirectoryPortion($installCategoryAbPath, $categoryAbPath, 1, 0, $current, $total);
}


# throws Exception
sub installMedia {
    my ($self, $fromDirectoryAbPath, $current, $total) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($fromDirectoryAbPath->toString());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{TEMPLATEPATH});
        $stringBuffer->append("images");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        my $viewStoreImagesDirectoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $storeAbPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() + $self->getCurrentHomeHostNamePath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        'org::allbinary::logic::io::file::FileUtil'->getInstance()->copyDirectoryPortion($viewStoreImagesDirectoryAbPath, $storeAbPath, 1, 0, $current, $total);
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $dataVector = 'org::allbinary::util::BasicArrayListD'->new();
        $dataVector->add($self->{name});
        $dataVector->add($self->{homeHostName});
        $dataVector->add($self->{homeHostNamePath}->toString());
        $dataVector->add($self->{hostName});
        $dataVector->add($self->{hostNamePath}->toString());
        $dataVector->add($self->{testHomeHostName});
        $dataVector->add($self->{testHomeHostNamePath}->toString());
        $dataVector->add($self->{testHostName});
        $dataVector->add($self->{testHostNamePath}->toString());
        $dataVector->add($self->{imagePath}->toString());
        $dataVector->add($self->{staticPath}->toString());
        $dataVector->add($self->{categoryPath}->toString());
        $dataVector->add($self->{inventoryControl});
        my $contextConfigurationDomDocumentMapping = 'org::allbinary::business::context::configuration::ContextConfigurationDomDocumentMapping'->new($self->getContextConfigurationInterface());
        $dataVector->add($contextConfigurationDomDocumentMapping->toDomDocumentString());
        $dataVector->add($self->{subStores});
        $dataVector->add($self->{tagLocation});
        $dataVector->add($self->{packageLocation});
        $dataVector->add($self->{ftp});
        $dataVector->add($self->{ftpPath}->toString());
        $dataVector->add($self->{ftpUserName});
        $dataVector->add($self->{ftpPassword});
        $dataVector->add($self->{testFtp});
        $dataVector->add($self->{testFtpPath}->toString());
        $dataVector->add($self->{testFtpUserName});
        $dataVector->add($self->{testFtpPassword});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $dataVector->add($time);
        $dataVector->add($time);
        return $dataVector;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $storeFrontData = 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance();
        my $dataHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $dataHashMap->put($storeFrontData->{NAME}, $self->{name});
        $dataHashMap->put($storeFrontData->{HOMEHOSTNAME}, $self->{homeHostName});
        $dataHashMap->put($storeFrontData->{HOMEHOSTNAMEPATH}, $self->{homeHostNamePath}->toString());
        $dataHashMap->put($storeFrontData->{HOSTNAME}, $self->{hostName});
        $dataHashMap->put($storeFrontData->{HOSTNAMEPATH}, $self->{hostNamePath}->toString());
        $dataHashMap->put($storeFrontData->{TESTHOMEHOSTNAME}, $self->{testHomeHostName});
        $dataHashMap->put($storeFrontData->{TESTHOMEHOSTNAMEPATH}, $self->{testHomeHostNamePath}->toString());
        $dataHashMap->put($storeFrontData->{TESTHOSTNAME}, $self->{testHostName});
        $dataHashMap->put($storeFrontData->{TESTHOSTNAMEPATH}, $self->{testHostNamePath}->toString());
        $dataHashMap->put($storeFrontData->{IMAGEPATH}, $self->{imagePath}->toString());
        $dataHashMap->put($storeFrontData->{STATICPATH}, $self->{staticPath}->toString());
        $dataHashMap->put($storeFrontData->{CATEGORYPATH}, $self->{categoryPath}->toString());
        $dataHashMap->put($storeFrontData->{INVENTORYCONTROL}, $self->{inventoryControl});
        my $contextConfigurationDomDocumentMapping = 'org::allbinary::business::context::configuration::ContextConfigurationDomDocumentMapping'->new($self->getContextConfigurationInterface());
        $dataHashMap->put($storeFrontData->{CONFIGURATION}, $contextConfigurationDomDocumentMapping->toDomDocumentString());
        $dataHashMap->put($storeFrontData->{SUBSTORES}, $self->{subStores});
        $dataHashMap->put($storeFrontData->{TAGLOCATION}, $self->{tagLocation});
        $dataHashMap->put($storeFrontData->{PACKAGELOCATION}, $self->{packageLocation});
        $dataHashMap->put($storeFrontData->{FTP}, $self->{ftp});
        $dataHashMap->put($storeFrontData->{FTPPATH}, $self->{ftpPath}->toString());
        $dataHashMap->put($storeFrontData->{FTPUSERNAME}, $self->{ftpUserName});
        $dataHashMap->put($storeFrontData->{FTPPASSWORD}, $self->{ftpPassword});
        $dataHashMap->put($storeFrontData->{TESTFTP}, $self->{testFtp});
        $dataHashMap->put($storeFrontData->{TESTFTPPATH}, $self->{testFtpPath}->toString());
        $dataHashMap->put($storeFrontData->{TESTFTPUSERNAME}, $self->{testFtpUserName});
        $dataHashMap->put($storeFrontData->{TESTFTPPASSWORD}, $self->{testFtpPassword});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $dataHashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $dataHashMap;
}


sub getKey {
    my ($self) = @_;
        return $self->getName();
}


sub getContextConfigurationInterface {
    my ($self) = @_;
        return $self->{contextConfigurationInterface};
}


sub setContextConfigurationInterface {
    my ($self, $contextConfigurationInterface) = @_;
        $self->{contextConfigurationInterface} = $contextConfigurationInterface;
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::configuration::ContextConfiguration;
use org::allbinary::business::context::configuration::ContextConfigurationDomDocumentMapping;
use org::allbinary::business::context::configuration::ContextConfigurationInterface;
use org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::AbPathUtil;
use org::allbinary::logic::string::SpecialCharacterUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::apache::commons::lang3::StringEscapeUtils;
use org::w3c::dom::Document;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::context::modules::storefront::StoreFrontData;

1;

