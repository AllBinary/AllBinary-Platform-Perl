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

package admin::tags::CustomLoaderTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{command} = undef;
    $self->{webappPath} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setCommand {
    my ($self, $command) = @_;
        $self->{command} = $command;
}


sub setWebappPath {
    my ($self, $value) = @_;
        $self->{webappPath} = $value;
}


# throws LicensingException
sub setCustomLoaderWebappPath {
    my ($self) = @_;
        try {
            my $urlGlobals = 'org::allbinary::globals::AppUrlGlobals'->new();
            $urlGlobals->setWebappPath($self->{webappPath});
            'org::allbinary::globals::URLGLOBALS'->init($urlGlobals);
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setCustomLoaderWebappPath()", $e);
            }
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if (defined($self->{command})) {
                if (($self->{command} cmp $org::allbinary::globals::GLOBALS2::SET) == 0) {
                    $self->setCustomLoaderWebappPath();
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::globals::AppUrlGlobals;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

