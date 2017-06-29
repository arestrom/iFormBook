Data Dictionary: *spawning ground* database
================
Are Strom
2017-06-29

Introduction
============

The new Washington Department of Fish and Wildlife (WDFW) *spawning\_ground* database, described below, is intended to be the successor to the existing Spawning Ground Database (SGS) that is currently hosted by WDFW in Olympia, Washington.

The current SGS database was designed primarily as a repository for raw, unexpanded data collected during spawning ground surveys, and from adult traps. The intent was to provide a common framework for the collection, storage, retrieval, and dissemination of data collected by public and private entities. WDFW maintains a centralized copy of the database, which contains historic and current spawning ground survey data from throughout Washington State.

#### Rationale for a new database

Development of the successor *spawning\_ground* database was spurred primarily by two factors:

-   The need by WDFW biologists to store a more extensive *richer* set of data
-   The need to simplify sharing of data with outside entities.

The growing popularity of mobile technology for data capture has vastly increased both the types of data, and volume of data, flowing from field to database. Mobile devices enable automated data capture using a wide assortment of sensors, including temperature probes, pH meters, barcode readers, and integrated GPS.

To accomodate this increased flow of *richer* data, the new *spawning\_ground* database has been designed to allow storing the full range of data that biologists are now able to collect during surveys. Whereas the previous SGS model was designed to store primarily *core* information, the new model is intended to store essentially *all* raw data collected during surveys. It also allows for storing less common data elements such as those collected during mark-recapture surveys, or bull-trout surveys.

The aim of this expanded data model is to provide a *one-database* solution for spawning ground survey data so that biologist can keep all their raw survey data in one place, and avoid the need to piece together data from disparate sources during the analysis phase.

To facilitate data sharing, the new database has been intentionally designed using technology and features that make it easier to integrate data from outside entities. For example, by using globally unique IDs for database keys, the need for central coordination in assigning database keys has been eliminated. By hosting the database in the AWS cloud rather than on WDFW servers, there is more flexibility in engineering secure solutions to allow outside entities to easily access and use the data.

#### Database objective

The overall objective of the *spawning\_ground* database is to help monitor status and trends of Coastal, Puget Sound, and Columbia Basin salmonid stocks. The database is built from a series of seasonal, systematic surveys of both index and *random* stream sections for evidence of adult salmonid spawning activity. Counts of adult fish and redds (nests) are recorded, which provide some of the raw material for generating spawning escapement estimates by species and stock.

Escapement estimates are a major component of our assessment of the status (health) of each stock. Questions associated with run timing and distribution of stocks may be answered by analyzing the temporal and spatial data in the *spawning\_ground* database.

Biologists apply various models and formulas to spawning ground data in order to calculate abundance and escapement estimates. Outputs from these analyses are entered into databases such as the Salmonid Stock Inventory (SaSI), or used in reports and stock assessments. The carcass, live, and redd counts in the database are actual daily counts recorded by spawning ground survey crews. The data are collected using various survey protocols for anadromous and resident species. Public and private entities collect survey data, although WDFW and tribal co-manager staff collects most of the data

#### Notes on table descriptions

The sections below document table and field definitions for the new *spawning\_ground* database. Table descriptions are arranged in descending order starting with top-level header data for individual surveys, and ending with tables that store data for individual fish or individual redds. Each section describes one *data* table.

Within each section, finer-grained descriptions of columns are provided for each table. For cases where columns link to a set of look-up table values, the relevant look-up tables are displayed directly below the table descriptions.

The final four columns of each *data* table include:

-   *created\_datetime*: timestamptz(6)
-   *created\_by*: varchar(16)
-   *modified\_datetime*: timestamptz(6)
-   *modified\_by*: varchar(16)

These columns document the *time* (with timezone) that each record was created or modified, and the *individual* or *application* that created or modified the record. For brevity these columns will not be included in the *data* table descriptions below, but should be assumed to be present.

Look-up tables can be identified by the underscore *lut* suffix in the table name. For example, *data\_source\_lut*. The final two columns of each *look-up* table include:

-   *obsolete\_flag*: boolean
-   *obsolete\_datetime* timestamptz(6)

These columns document if a field has been *retired* or deemed *obsolete*, along with the date when the field was retired. For brevity these columns will not be included in the *look-up* table descriptions below, but should be assumed to be present.

Values recorded in each look-up table are displayed directly below the field definitions. For look-up tables with a large number of values, such as the stream\_lut, only a selection of values will be displayed.

#### Disclaimer

The *spawning\_ground* database is a work in progress and is subject to change. If you have any questions please contact the data manager Are Strom (<Are.Strom@dfw.wa.gov>).

Database diagram
================

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-7ab535abf7abc4a43dd5">{"x":{"links":{"source":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17,20,21,21,21,23,25,27,28,29,30,31,32,34,35,35,35,35,35,35,35,36,37,38,40,41,42,43,44,45,46,47,48,49,50,51,53,54,56,57,58,58,58,59,60,62,63,64,65,65,65,66,67,68,69,71,72,73,73,73,73,73,73,73,73,73,73,75,76,77,78,78,80,82,83,84,85,86,88,89],"target":[21,74,16,16,32,39,79,78,21,32,73,73,73,19,19,74,21,19,19,24,32,22,26,21,32,18,32,73,22,32,16,19,21,39,58,73,87,39,39,35,35,24,24,24,24,24,24,48,24,21,81,50,21,21,55,55,33,55,61,33,58,78,21,32,26,78,79,35,74,74,35,61,61,16,18,26,52,70,74,78,79,81,87,73,74,78,21,58,73,74,74,74,70,74,87,35],"value":[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,6,6,6,2,2,2,2,2,2,2,6,2,6,6,6,6,6,6,6,2,2,2,2,2,2,2,2,2,2,2,2,2,6,2,2,2,2,2,6,6,6,2,2,2,2,2,2,2,2,2,2,2,2,2,2,6,6,6,6,6,6,6,6,6,6,2,2,2,6,6,2,2,2,2,2,2,2,2]},"nodes":{"name":["adipose_clip_status_lut","area_surveyed_lut","barrier_measurement_type_lut","barrier_type_lut","carcass_condition_type_lut","coordinate_capture_method_lut","count_type_lut","cwt_detection_method_lut","cwt_detection_status_lut","cwt_result_type_lut","data_review_status_lut","data_source_lut","data_source_unit_lut","disposition_lut","disposition_type_lut","fish_abundance_condition_lut","fish_barrier","fish_behavior_type_lut","fish_capture","fish_capture_event","fish_capture_status_lut","fish_encounter_event","fish_length_measurement","fish_length_measurement_type_lut","fish_mark","fish_presence_type_lut","fish_species_presence","fish_status_lut","fish_trauma_type_lut","gear_performance_type_lut","gill_condition_type_lut","incomplete_survey_type_lut","individual_fish","individual_redd","live_fish_condition_type_lut","location","location_error_correction_type_lut","location_error_type_lut","location_orientation_type_lut","location_source","location_type_lut","mark_color_lut","mark_orientation_lut","mark_placement_lut","mark_shape_lut","mark_size_lut","mark_status_lut","mark_type_category_lut","mark_type_lut","maturity_lut","mobile_device","mobile_device_type_lut","mobile_survey_form","mortality_type_lut","origin_lut","redd_confidence","redd_confidence_review_status_lut","redd_confidence_type_lut","redd_encounter_event","redd_shape_lut","redd_status_lut","redd_substrate","run_lut","sex_lut","spawn_condition_type_lut","species_lut","stream_channel_type_lut","stream_condition_lut","stream_flow_type_lut","stream_lut","stream_measurement","substrate_level_lut","substrate_type_lut","survey","survey_comment","survey_completion_status_lut","survey_count_condition_lut","survey_design_type_lut","survey_event","survey_intent","survey_method_lut","survey_mobile_device","survey_timing_lut","survey_visibility_type_lut","visibility_condition_lut","water_clarity_type_lut","weather_type_lut","wildlife_encounter","wildlife_type_lut","wria_lut"],"group":["adipose_clip_status_lut","area_surveyed_lut","barrier_measurement_type_lut","barrier_type_lut","carcass_condition_type_lut","coordinate_capture_method_lut","count_type_lut","cwt_detection_method_lut","cwt_detection_status_lut","cwt_result_type_lut","data_review_status_lut","data_source_lut","data_source_unit_lut","disposition_lut","disposition_type_lut","fish_abundance_condition_lut","fish_barrier","fish_behavior_type_lut","fish_capture","fish_capture_event","fish_capture_status_lut","fish_encounter_event","fish_length_measurement","fish_length_measurement_type_lut","fish_mark","fish_presence_type_lut","fish_species_presence","fish_status_lut","fish_trauma_type_lut","gear_performance_type_lut","gill_condition_type_lut","incomplete_survey_type_lut","individual_fish","individual_redd","live_fish_condition_type_lut","location","location_error_correction_type_lut","location_error_type_lut","location_orientation_type_lut","location_source","location_type_lut","mark_color_lut","mark_orientation_lut","mark_placement_lut","mark_shape_lut","mark_size_lut","mark_status_lut","mark_type_category_lut","mark_type_lut","maturity_lut","mobile_device","mobile_device_type_lut","mobile_survey_form","mortality_type_lut","origin_lut","redd_confidence","redd_confidence_review_status_lut","redd_confidence_type_lut","redd_encounter_event","redd_shape_lut","redd_status_lut","redd_substrate","run_lut","sex_lut","spawn_condition_type_lut","species_lut","stream_channel_type_lut","stream_condition_lut","stream_flow_type_lut","stream_lut","stream_measurement","substrate_level_lut","substrate_type_lut","survey","survey_comment","survey_completion_status_lut","survey_count_condition_lut","survey_design_type_lut","survey_event","survey_intent","survey_method_lut","survey_mobile_device","survey_timing_lut","survey_visibility_type_lut","visibility_condition_lut","water_clarity_type_lut","weather_type_lut","wildlife_encounter","wildlife_type_lut","wria_lut"]},"options":{"NodeID":"name","NodeGroup":"name","LinkGroup":null,"colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":12,"fontFamily":null,"nodeWidth":30,"nodePadding":10,"units":"","margin":{"top":null,"right":null,"bottom":null,"left":null},"iterations":32,"sinksRight":true}},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
Survey
======

##### *Top level header information for surveys*

| Column name                    | Data type       | Nullable? | Key     | Description                                      |
|:-------------------------------|:----------------|:----------|:--------|:-------------------------------------------------|
| survey\_id                     | uuid            | No        | Primary | Globally unique primary key                      |
| survey\_datetime               | timestamptz (6) | No        |         | Date of survey                                   |
| data\_source\_id               | uuid            | No        | Foreign | Organization that conducted the survey           |
| data\_source\_unit\_id         | uuid            | No        | Foreign | Unit within data source organization             |
| survey\_method\_id             | uuid            | No        | Foreign | Method used to conduct survey (foot, raft, etc.) |
| data\_review\_status\_id       | uuid            | No        | Foreign | Status of data review (final, preliminary, etc.) |
| survey\_start\_location\_id    | uuid            | No        | Foreign | Link to location table, describes start point    |
| survey\_end\_location\_id      | uuid            | No        | Foreign | Link to location table, describes end point      |
| survey\_completion\_status\_id | uuid            | No        | Foreign | Was survey completed (partial, completed, etc.)  |
| incomplete\_survey\_type\_id   | uuid            | No        | Foreign | Reason that survey was not completed             |
| survey\_start\_datetime        | timestamptz (6) | Yes       |         | Time of day when survey started                  |
| survey\_end\_datetime          | timestamptz (6) | Yes       |         | Time of day when survey ended                    |
| observer\_last\_name           | varchar (75)    | Yes       |         | Last name of person(s) conducting the survey     |
| data\_submitter\_last\_name    | varchar (50)    | Yes       |         | Last name of person who submitted the data.      |

### data\_source\_lut

##### *Organization that conducted the survey*

| Column name        | Data type    | Nullable? | Key     | Description                 |
|:-------------------|:-------------|:----------|:--------|:----------------------------|
| data\_source\_id   | uuid         | No        | Primary | Globally unique primary key |
| data\_source\_name | varchar (75) | No        |         | Name of organization        |
| data\_source\_code | varchar (15) | No        |         | Organization code           |

| data\_source\_id                     | data\_source\_name                              | data\_source\_code |
|:-------------------------------------|:------------------------------------------------|:-------------------|
| f528317b-655e-4232-8b33-092175de6a36 | AmeriCorps                                      | AMCRP              |
| 25c577cd-3e69-4d34-9066-0d9126817fe9 | Army Corps of Engineers                         | ACOE               |
| 80e25670-fbc4-4f58-8566-364a1314373d | Beak Consultants                                | BC                 |
| 68832d03-bbef-4411-8f14-9b07e031ba78 | Chehalis Tribe                                  | CHEH               |
| 2aa98d95-cef4-4a5a-a496-cdac7904feea | Chelan County Public Utility District           | CCPUD              |
| a9247276-c9bc-45a6-af2a-156b6c3ea3ed | Chinook Tribe                                   | CHNK               |
| f70f8dcb-aaed-4c1a-91b9-802be1cb3a06 | City of Bellingham                              | COB                |
| be860d61-ea50-49a5-9e94-c719ae8b248e | Colville Tribe                                  | COLV               |
| 4ddd0997-e08d-4254-9644-b15b3824d44b | Cowlitz Tribe                                   | COW                |
| bf394ebd-abb2-4c89-83c6-e1e628f4b467 | Duwamish Tribe                                  | DUWA               |
| bc9caff8-b233-4880-91c0-00bef00c0c9f | Fourth Corner Fly Fishers Club                  | FCFF               |
| b7a5bc02-6c10-46c9-b216-5ccf73481e33 | Hoh Tribe                                       | HOH                |
| 2bcfc2fa-c21f-49d6-8221-165f49ee0e4e | Hood Canal Salmon Enhancement Group             | HCSEG              |
| 6ba288e3-90dd-4e9e-8315-668acb82d2b7 | Hosey and Assoc. Consultants                    | HAC                |
| 87d6c0f6-59cc-494b-9c32-1af771c42a17 | Jamestown S'Klallam Tribe                       | JST                |
| 9f00ca91-5cb2-4925-a9e4-d78b73445fbf | Jones and Stokes Consultants                    | JSC                |
| 42739dae-bce4-49c3-969f-39cd07db7c4d | King County                                     | KNGC               |
| 604a618e-a10d-4c94-850f-6356f03fe29a | Kitsap County                                   | KC                 |
| 37598612-5794-4b7e-9d39-453c13ce19b8 | Kitsap Stream Team                              | KST                |
| f4ba760f-87a5-438b-ad6a-e13ce5978759 | Long Live the Kings                             | LLTK               |
| 9232e0c7-0021-4598-8941-4beb09146415 | Lower Elwha Klallam Tribe                       | LEKT               |
| ff12ecc5-1337-4aca-8e76-22561341ac9f | Lummi Tribe                                     | LUMM               |
| b53352e4-970a-4c20-bf8a-785bad44dd2a | Makah Tribe                                     | MAK                |
| 52a63c49-f8a4-4e01-81fd-41f61a294bd1 | Muckleshoot Tribe                               | MUCK               |
| 6cd2179d-3026-49e1-829f-ed6d1acc8a38 | National Marine Fisheries Service               | NMFS               |
| 6813bde4-e2b8-4ead-8330-2e8a5d0639c0 | National Oceanic and Atmospheric Administration | NOAA               |
| 121142b7-c25c-4ead-b06f-d3f0222d483f | National Park Service                           | NPS                |
| c7784bd0-b138-4fdc-8f50-5ca61bc1e3f3 | Nez Perce Tribe                                 | NEZ                |
| 94bcd95a-48d2-4b5f-8c29-4ea3395e9fff | Nisqually Tribe                                 | NIT                |
| c7f89920-60b9-44d9-8827-71bd904a17c5 | Nooksack Salmon Enhancement Association         | NSEA               |
| 84740898-df3b-4229-849c-643794071edb | Nooksack Tribe                                  | NOOK               |
| 026bcbf2-88eb-4280-9d5f-4420ce4e01ce | North Olympic Salmon Coalition                  | NOSC               |
| 46acc453-e130-460a-a037-be3f9df97024 | Northwest Watershed Institute                   | NWI                |
| d5787f49-32aa-4da4-9cd5-3391b766fcef | Not applicable                                  | na                 |
| 954eea36-5fc2-4741-9006-f49ec1451ce6 | Oregon Department of Fish and Wildlife          | ODFW               |
| 8cb96d81-03e1-4201-8c55-7ba89d0cf84b | Pacific County                                  | PACI               |
| 6d9b3af0-8161-4650-8237-62694d415342 | Point No Point Treaty Council                   | PNPTC              |
| ac1f08be-7df4-498e-9e50-94e1e9bdd2fe | Port Gamble S'Klallam Tribe                     | PGST               |
| 568b50ba-92cc-4db5-979b-44471c787898 | Puget Sound Energy                              | PSE                |
| b2cd183d-b29e-4de1-8fe0-0471740b6a90 | Puyallup Tribe                                  | PUY                |
| dc900b02-8dd6-4d7f-ba95-f271f4c22d4b | Quileute Tribe                                  | QUIL               |
| f40af5fa-7f51-4594-87ec-fc9870c78c44 | Quinault Tribe                                  | QUIN               |
| 4f4b2b9e-e216-4709-8ecf-ae289d2b5262 | R2 Resource Consultants                         | R2                 |
| c16645fd-6627-466e-93a8-e10ac33fb396 | Samish Tribe                                    | SAM                |
| 7a13e856-560a-497d-bd43-cf436754c867 | Sauk-Suiattle Tribe                             | SST                |
| f786e8dc-a93a-4114-b888-c4182c5ca85f | Seattle City Light                              | SCL                |
| 9ba82ba8-d652-4973-bf94-31254044f3e1 | Seattle Metro                                   | SEA                |
| f96923f5-96df-4137-a225-07bb18231b79 | Sherwood Creek Enhancement Group                | SCEG               |
| 91a85517-ccd4-489d-bd86-2ed6e1577152 | Shoalwater Tribe                                | SHOA               |
| f9207572-a92f-4b9f-9f52-9103d4eb0351 | Skagit County Public Works                      | SCPW               |
| 85c3436e-5d6b-46f7-b45d-367429b09512 | Skagit Fisheries Enhancement Group              | SFEG               |
| 027aec24-aca3-4ff7-9bda-428bbefe35c4 | Skagit River System Cooperative                 | SRSC               |
| ea6fbf6b-2ee4-49d9-a864-a530faed806b | Skokomish Tribe                                 | SKOK               |
| 94498888-d27d-495e-9203-529bb14e9965 | Skykomish Tribe                                 | SKY                |
| a5fad62f-4018-45cd-a88e-79889cbbd891 | Small Tribes Organization of Western Washington | STOWW              |
| 18b8c613-a7b5-4468-aedc-3146a3b1e7ab | Snohomish County                                | SNOCO              |
| c7f35b63-89d4-4d07-bec7-a20588888573 | Snohomish County Public Utility District        | SnoPUD             |
| b073b79d-03c8-4172-8fd6-5be5f021033a | Snohomish Tribe                                 | SNOH               |
| a2d57d27-6fa0-4005-ab1f-8080c4556752 | Snoqualmie Tribe                                | SNOQ               |
| 647055cb-4842-4ff5-96ac-aa8e37b37f8d | Squaxin Tribe                                   | SQUAX              |
| 0f5d53ea-4dc7-45aa-8db0-6ae83ad0d922 | Steilacoom Tribe                                | STEIL              |
| cf17506a-3b82-497d-83f6-278f420eb64c | Stillaguamish Tribe                             | STILL              |
| 2bb40133-9b18-4d63-b8c4-47fde3063251 | Suquamish Tribe                                 | SUQU               |
| 9b48ad13-b9b4-4a58-80e9-e96381cdc5ba | Swinomish - Aboriginal Tribe                    | SAT                |
| 12a813fd-370e-44c3-a51c-14bc47bf36c7 | Swinomish Tribe                                 | SWIN               |
| 62630826-a519-48fb-9ea3-12c6f0f04576 | The Nature Conservancy                          | TNC                |
| dc0e51c6-f49f-4c68-abaa-814b3c5608a6 | Tulalip Tribe                                   | TULA               |
| 82659ab1-07fa-4cf2-94ad-730e65f19ba0 | Umatilla Tribe                                  | UMAT               |
| e347cd67-8362-4a34-9fba-11a569dd625d | University of Washington                        | UW                 |
| 08326a99-f813-4653-b516-c1d97cb37a20 | Unknown                                         | UNK                |
| 81fae5c4-bd2e-48fc-abc7-abce30905cbb | Upper Skagit (Skagit System Co-op) Tribe        | USSC               |
| 536960e4-b8b9-4096-95f2-81d4aff52bf6 | Upper Skagit Tribe                              | USIT               |
| ddd772e1-27e1-4b49-b64e-4838237a916a | US Fish and Wildlife Service                    | USFWS              |
| 486cdb69-36ca-4755-af1f-a6cd89d63f04 | US Forest Service                               | USFS               |
| 1d65fbdc-f92f-4e88-8a9d-9d3c89cfc31f | Volunteer-WDFW                                  | VOL                |
| 0d2ff02c-1c41-409f-b9e4-c4daf018a03e | Warm Springs Tribe                              | WARM               |
| 67db455c-1d40-4b20-9c6c-7696bd9cea84 | Washington Conservation Corp                    | WCC                |
| c40563fa-efce-4cac-a2e3-6223a5e24030 | Washington Department of Fish and Wildlife      | WDFW               |
| 15c063f3-d91b-487a-a4f1-d6fbc77a0a68 | Washington Department of Game (historic)        | WDG                |
| 7cfc0dfc-a800-4a46-bf33-46f980aecfa1 | Washington Department of Natural Resources      | DNR                |
| 6dd0ef5d-9903-4d65-99a8-02a9f6ec9796 | Washington Department of Wildlife (historic)    | WDW                |
| feaa266d-8bf6-4527-813c-1c3a3161db70 | WDFW and Muckleshoot Tribe combined             | WDFW & MUCK        |
| d5a2de2f-f6ef-4c5c-a433-4701095f9a6f | Whatcom Chapter of Trout Unlimited              | TU                 |
| 68230c4e-2db2-4f59-a293-793b1681d0a3 | Wild Fish Conservancy                           | WFC                |
| f42db7fc-e6ad-4d8b-a0a5-26c98fe6089f | Willapa Alliance                                | WILLA              |
| 58395bef-2879-480c-b02a-1b84aa331e56 | Yakama Tribe                                    | YAKA               |

### data\_source\_unit\_lut

##### *Unit within organization that conducted the survey*

| Column name              | Data type    | Nullable? | Key     | Description                 |
|:-------------------------|:-------------|:----------|:--------|:----------------------------|
| data\_source\_unit\_id   | uuid         | No        | Primary | Globally unique primary key |
| data\_source\_unit\_name | varchar (75) | No        |         | Name of organization unit   |

| data\_source\_unit\_id               | data\_source\_unit\_name      |
|:-------------------------------------|:------------------------------|
| 88e2e71d-7656-412f-92ee-130a20c76957 | WDFW District 6               |
| b71ff576-380a-49f5-8c92-1e7c4db61f50 | WDFW District 9               |
| 4e3b2e14-7d38-4e42-ae18-22330d2b12e9 | WDFW District 14              |
| e7dd7145-34d9-47e0-a0e6-2fd50e163dea | WDFW District 12              |
| b340d06f-0b31-484e-9dfc-35450e95e24d | WDFW District 1               |
| d6227ecd-0f45-46ab-a868-36c382dad3df | Unknown                       |
| 49ad04a3-b527-40b7-a4c5-3b8832f9adc8 | WDFW District 17              |
| 53e9a422-14b6-4ba6-a140-4d400285f3b1 | WDFW IMW                      |
| e66090c1-93b6-46c0-9279-575259533e2a | Region 5 ESA Chinook          |
| c56fdf14-2ec9-443b-867e-6183581d1cdb | WDFW District 13              |
| d3fcf6ca-84ec-4b4b-84c8-72f412c39eff | Region 5 ESA Winter Steelhead |
| 76a8a910-7c12-4ef2-a390-7675c0bd6460 | WDFW District 7               |
| af72cf7c-edce-456c-ad50-785c7221b9d3 | WDFW District 8               |
| e4f9d2e8-c95b-40a2-9bee-80449657a2b3 | WDFW District 2               |
| 045e2b81-8b3c-49b3-9bb4-9606c432f394 | WDFW District 4               |
| 05589baa-0556-45f1-a4bb-9c8c35b965a9 | WDFW District 10              |
| 93c3714f-fdc9-45d1-971a-a03403bcffda | WDFW District 11              |
| 17e4426d-a706-4076-b905-ba4d3082a85e | WDFW District 5               |
| ac4f2dde-985e-40cf-bf4b-c2b2be71a9f6 | Region 5 ESA Coho             |
| aad88cca-65d2-4d57-80b6-c8613841b7ff | Region 5 ESA Chum             |
| 7c100571-f9c3-4b2d-b534-d0cf1e057526 | Region 5 ESA Summer Steelhead |
| e2d51ceb-398c-49cb-9aa5-d20a839e9ad9 | Not applicable                |
| 927acf98-1b65-43e1-8939-d33e167ab791 | WDFW District 15              |
| c62aa4ab-d6e4-420c-be51-dbd9f57481d2 | WDFW District 16              |
| 3f5ca0b9-538a-4e9a-b69a-fa6a68c400e9 | WDFW District 3               |

### survey\_method\_lut

##### *Physical method used to conduct the survey*

| Column name                 | Data type     | Nullable? | Key     | Description                 |
|:----------------------------|:--------------|:----------|:--------|:----------------------------|
| survey\_method\_id          | uuid          | No        | Primary | Globally unique primary key |
| survey\_method\_code        | varchar (25)  | No        |         | Description of method       |
| survey\_method\_description | varchar (150) | No        |         |                             |

| survey\_method\_id                   | survey\_method\_code | survey\_method\_description         |
|:-------------------------------------|:---------------------|:------------------------------------|
| faa6bfd2-1a33-4b53-9798-0282f9ec21f8 | Raft                 | Raft survey                         |
| 90237962-8b95-4848-9e6e-049b02810ba0 | F&S                  | Combination foot and snorkle survey |
| e3a9eb81-28b7-4f2d-9bc0-117d5f6ee13d | Rack                 | Rack survey                         |
| c7877962-b4c0-457f-9932-16338c5d6b7d | Boat                 | Float survey                        |
| 784de7bc-3c6e-4956-8cc6-1e2fc2717edf | Electrofishing       | Electrofishing survey               |
| b49b93a8-8fee-46dc-9748-2223dcaa07fb | Weir                 | Weir survey                         |
| a48fe995-bd60-4a58-a030-279e5407ae1c | Aero                 | Airplane survey                     |
| b5e9344e-7459-44c2-85ed-53d755c2614f | Heli                 | Helicopter survey                   |
| b98792d6-84a7-497b-b4ec-54040048ba0a | Hook                 | Hook and line survey                |
| a98f1cfb-c9b7-4edb-87da-5962edef6378 | Trap                 | Trap survey                         |
| a5ac2058-4253-41c4-ae01-847618ce199c | Ladr                 | Fish ladder survey                  |
| 136f51d6-f492-48b0-9a0c-8a992056d677 | Foot                 | Foot survey                         |
| 9adcae68-c796-4b92-b241-9f7bee5b9962 | Snor                 | Snorkel survey                      |
| 2ee94beb-ed61-443e-9556-b43acb94ae75 | Unknown              | Unknown method                      |
| 2ddf2ba7-1c57-4eb5-83df-c92e3570bdda | Seine                | Seine survey                        |

### data\_review\_status\_lut

##### *Status of data review process*

| Column name                       | Data type    | Nullable? | Key     | Description                      |
|:----------------------------------|:-------------|:----------|:--------|:---------------------------------|
| data\_review\_status\_id          | uuid         | No        | Primary | Globally unique primary key      |
| data\_review\_status\_description | varchar (75) | No        |         | Description of review categories |

| data\_review\_status\_id             | data\_review\_status\_description |
|:-------------------------------------|:----------------------------------|
| 2a225585-f231-49d3-90f1-0d4acb2720fa | Not applicable                    |
| b0ea75d4-7e77-4161-a533-5b3fce38ac2a | Preliminary                       |
| 44a7d7af-82a9-4dac-a14a-8c1030819844 | Final                             |
| 4c76b6fe-494c-49eb-896a-91060698526f | Unknown                           |

### survey\_completion\_status\_lut

##### *Was the survey completed?*

| Column name                     | Data type     | Nullable? | Key     | Description                      |
|:--------------------------------|:--------------|:----------|:--------|:---------------------------------|
| survey\_completion\_status\_id  | uuid          | No        | Primary | Globally unique primary key      |
| completion\_status\_description | varchar (100) | No        |         | Description of status categories |

| survey\_completion\_status\_id       | completion\_status\_description |
|:-------------------------------------|:--------------------------------|
| 71ab2649-62d9-4d48-bad1-0b8a41f352a4 | Unknown                         |
| 9c72357a-8e98-4c98-888c-3412902bf0bf | Partial survey                  |
| 149d7253-6a25-4c4c-a7e2-a6cbbbb9850a | No survey conducted             |
| d192b32e-0e4f-4719-9c9c-dec6593b1977 | Completed survey                |

### incomplete\_survey\_type\_lut

##### *Why was the survey not completed?*

| Column name                     | Data type     | Nullable? | Key     | Description                    |
|:--------------------------------|:--------------|:----------|:--------|:-------------------------------|
| incomplete\_survey\_type\_id    | uuid          | No        | Primary | Globally unique primary key    |
| incomplete\_survey\_description | varchar (200) | No        |         | Descriptions of why incomplete |

| incomplete\_survey\_type\_id         | incomplete\_survey\_description |
|:-------------------------------------|:--------------------------------|
| cde5d9fb-bb33-47c6-9018-177cd65d15f5 | Not applicable                  |
| 6888b209-db39-4a9c-a1e2-29621e63ccef | Locked gate, or inaccessible    |
| 8f808e6b-517c-4f6c-b739-33a59346b64e | Denied access by landowner      |
| 30707397-2177-49b6-bd12-a153177bb50c | Stream too high                 |
| 73e7bff9-8415-4c14-81df-d9b2d1f13d39 | Other safety concerns           |

Location
========

##### *Data associated with point locations*

| Column name                       | Data type       | Nullable? | Key     | Description                                      |
|:----------------------------------|:----------------|:----------|:--------|:-------------------------------------------------|
| location\_id                      | uuid            | No        | Primary | Globally unique primary key                      |
| stream\_id                        | uuid            | No        | Foreign | Link to table of streams in WA State             |
| wria\_id                          | uuid            | No        | Foreign | Link to table of watersheds in WA State          |
| location\_type\_id                | uuid            | No        | Foreign | Type of location (start point, redd, etc)        |
| stream\_channel\_type\_id         | uuid            | No        | Foreign | Type of channel (mainstem, left braid, etc.)     |
| location\_orientation\_type\_id   | uuid            | No        | Foreign | Orientation of point in channel (mid, left, etc) |
| river\_mile\_measure              | numeric (6, 2)  | Yes       |         | Distance from mouth of stream to point           |
| location\_code                    | varchar (10)    | Yes       |         | Short code to identify point                     |
| location\_name                    | varchar (150)   | Yes       |         | Name of point (place name, ReddID, etc.)         |
| location\_description             | varchar (200)   | Yes       |         | Extended description of point                    |
| latitude\_decimal\_degree\_wgs84  | numeric (12, 9) | Yes       |         | Latitude in decimal degree and WGS84 datum       |
| longitude\_decimal\_degree\_wgs84 | numeric (14, 9) | Yes       |         | Longitude in decimal degree and WGS84 datum      |
| horizontal\_accuracy\_meter       | numeric (6, 2)  | Yes       |         | Estimated horizontal error of point in meters    |
| latitude\_longitude\_id           | varchar (13)    | Yes       |         | Unique ID for stream using terminus coordinates  |
| nhd\_reach\_code                  | varchar (14)    | Yes       |         | Unique NHD identifier for a given stream reach   |
| waloc\_id                         | int4            | Yes       |         | Link to remote table listing PSC codes           |

### stream\_lut

##### *Attributes for streams in WA State*

| Column name           | Data type     | Nullable? | Key     | Description                                      |
|:----------------------|:--------------|:----------|:--------|:-------------------------------------------------|
| stream\_id            | uuid          | No        | Primary | Globally unique primary key                      |
| stream\_name          | varchar (150) | No        |         | Long version of stream name                      |
| stream\_display\_name | varchar (75)  | Yes       |         | Stream name formatted for mobile device displays |
| stream\_catalog\_code | varchar (10)  | No        |         | Code from the WA Streams Catalog                 |
| tributary\_to\_name   | varchar (150) | Yes       |         | Body of water the stream flows into              |

| stream\_name           | stream\_display\_name | stream\_catalog\_code | tributary\_to\_name |
|:-----------------------|:----------------------|:----------------------|:--------------------|
| Alder Creek (LB)       | Alder Cr (23.1185)    | 23.1185               | Chehalis River      |
| Anderson Creek 15.0412 | Anderson Cr (15.0412) | 15.0412               | Hood Canal          |

### wria\_lut

##### *Water Resource Inventory Areas (watersheds) in WA State*

| Column name       | Data type    | Nullable? | Key     | Description                  |
|:------------------|:-------------|:----------|:--------|:-----------------------------|
| wria\_id          | uuid         | No        | Primary | Globally unique primary key  |
| wria\_code        | varchar (2)  | No        |         | Code for the watershed       |
| wria\_description | varchar (75) | No        |         | Description of the watershed |

| wria\_id                             | wria\_code | wria\_description     |
|:-------------------------------------|:-----------|:----------------------|
| 9d8b97ad-f24c-4006-9d80-f1c032a57737 | 00         | Sumas                 |
| 6754e292-ad59-4711-b6b6-b387138b9dc5 | 01         | Nooksack              |
| 2e83964e-685e-4185-9aeb-d749eaff6a67 | 02         | San Juan              |
| de39ce2b-8dcc-4497-b40c-5233f22b764e | 03         | Lower Skagit-Samish   |
| a399eab0-fce8-4aa8-bf36-55ced624c208 | 04         | Upper Skagit          |
| 0b23b1fa-1710-4ff4-b0e2-ddea2c5f2d8d | 05         | Stillaguamish         |
| 29f453bf-4a2a-4dd5-9c4b-49228c30e936 | 06         | Island                |
| f7925779-389a-4a7a-98f2-9fef3a3a0667 | 07         | Snohomish             |
| 581876f6-5f6f-4893-a7cd-b1a66883779a | 08         | Cedar-Sammamish       |
| e3964f67-858c-4b17-86b5-1dce39ed43f7 | 09         | Duwamish-Green        |
| 76dc4710-0da9-48dd-b434-30bd4eacc262 | 10         | Puyallup-White        |
| 1d92a589-bb99-4369-80c4-e6e9825c04b0 | 11         | Nisqually             |
| c4d6179b-813d-46d7-8216-6ec7c72e7358 | 12         | Chambers-Clover       |
| 7f2aa41b-b489-428a-896a-7eb0c58ff82f | 13         | Deschutes             |
| f53836c3-8ce1-4313-aef0-97b9fbd39818 | 14         | Kennedy-Goldsborough  |
| deeb79f8-e370-4b07-b6f8-378cdf1dc48c | 15         | Kitsap                |
| 82561b53-0aac-4347-8db1-1a36589110a5 | 16         | Skokomish-Dosewallips |
| b58f7f9b-daf9-41ed-9a46-73925aa6045c | 17         | Quilcene-Snow         |
| 256529e8-9ed6-4da2-a3f6-1957d8f09c8e | 18         | Elwah-Dungeness       |
| f606cca2-e617-4f29-8375-d890caf72295 | 19         | Lyre-Hoko             |
| 0e24f04b-a6ca-4740-a048-e1844d922248 | 20         | Soleduc               |
| b41241cd-b7b7-4180-8bae-145969b8b98b | 21         | Queets-Quinault       |
| fc152f92-c626-4965-90c6-87ae2bdccac5 | 22         | Lower Chehalis        |
| d398adc5-fc6f-4c58-9a91-9dc42030ef57 | 23         | Upper Chehalis        |
| 76fec485-909d-4e88-aa09-afb5bf60beab | 24         | Willapa               |
| bbfb7613-0711-49d6-9984-98d076b3cf80 | 25         | Grays-Elochoman       |
| d94f94f8-720e-48f0-afa6-579d76f56eb7 | 26         | Cowlitz               |
| 4f3f90df-4199-42d0-9b68-84ad37107062 | 27         | Lewis                 |
| b8ac4d46-ace7-4bcd-9f24-40789a37c729 | 28         | Salmon-Washougal      |
| 21f07857-e137-499b-9e3a-8c2bd30a45b6 | 29         | Wind-White Salmon     |
| b56ba843-d252-41ef-9492-606a16a993c4 | 30         | Klickitat             |
| 570bc7af-4a49-4c4c-9546-7d7bb2d14692 | 31         | Rock-Glade            |
| edce36c4-e0b5-488b-8300-2850e370d57e | 32         | Walla Walla           |
| 557ff735-7866-4d0a-8b75-fc793317df5c | 33         | Lower Snake           |
| d7645a7d-64ea-4b95-8cb8-9602dfd33d0e | 34         | Palouse               |
| a3f2e3ac-6fc3-4a7e-832f-5d280259fc3f | 35         | Middle Snake          |
| e8f45a19-f2ed-4fed-a045-75c43b72af35 | 36         | Esquatzel Coulee      |
| 8cdcc8a3-d6e5-435a-aeae-26d1ec93cc9f | 37         | Lower Yakima          |
| 9fda35f6-1d01-4bad-ae27-e39d8b6269b5 | 38         | Naches                |
| f7b1aa02-185b-4881-9c3c-aa821d7a1666 | 39         | Upper Yakima          |
| db8d3016-334c-4a07-95fd-9708d725218d | 40         | Alkali-Squilchuck     |
| c664dd70-97ce-404b-9c20-93496ce963dd | 41         | Lower Crab            |
| 05a4cd3a-ce1c-403b-9728-dfb1d7f409fa | 42         | Grand Coulee          |
| cab4df28-f3ab-4eff-9eb6-4d8144045a82 | 43         | Upper Crab-Wilson     |
| bfba4008-b032-4e9a-bc95-34acad0331ca | 44         | Moses Coulee          |
| 96bec6b3-2966-4c91-bdd9-aaa8c2034381 | 45         | Wenatchee             |
| b68aa773-6e1f-42d5-8bf9-ede3d3f0e017 | 46         | Entiat                |
| ba786aa9-cdc0-4ebf-adf8-acb26ad33c99 | 47         | Chelan                |
| 09f60c5c-cc53-4fff-b4b5-7d2245e13250 | 48         | Methow                |
| 7cfb07b4-e474-4efd-9103-00c5b90c166c | 49         | Okanogan              |
| 1538810c-66b8-4874-8a98-7c9217db0010 | 50         | Foster                |
| 425f30c1-5485-4284-a629-adbbffec3173 | 51         | Nespelem              |
| 855a0f42-341b-48c0-a682-cf84f9d639f4 | 52         | Sanpoil               |
| bdf87d49-ed71-4456-a186-e2152c552ede | 53         | Lower Lake Roosevelt  |
| b7a2e24f-fa58-4788-b3ce-a7801886145f | 54         | Lower Spokane         |
| ca957e5d-725e-4ef4-851a-6100168ce8bf | 55         | Little Spokane        |
| de3a0495-4c1b-401a-9d67-8c483eab57d2 | 56         | Hangman               |
| f9d2a8fa-48ae-4f79-91f4-b1a86220dc8f | 57         | Middle Spokane        |
| fc7c461c-576d-466f-a0c4-b9f28e1bafc7 | 58         | Middle Lake Roosevelt |
| 71973bae-764e-4666-9ddc-b92bab8d5ce3 | 59         | Colville              |
| c92fb949-0443-44dc-89e1-5e0b7e709628 | 60         | Kettle                |
| afb3b834-7098-4d14-be65-3e978f77ffd2 | 61         | Upper Lake Roosevelt  |
| 4c23cd23-ddca-4152-808b-2caac83e40ab | 62         | Pend Oreille          |

### location\_type\_lut

##### *Type of location (trap, redd, etc.)*

| Column name                 | Data type     | Nullable? | Key     | Description                      |
|:----------------------------|:--------------|:----------|:--------|:---------------------------------|
| location\_type\_id          | uuid          | No        | Primary | Globally unique primary key      |
| location\_type\_description | varchar (100) | No        |         | Description of the location type |

| location\_type\_id                   | location\_type\_description |
|:-------------------------------------|:----------------------------|
| da8d8d86-1b40-4f7c-beaa-109a1b70e462 | Disposition location        |
| d5edb1c0-f645-4e82-92af-26f5637b2de0 | Redd encounter              |
| c8c4020f-36ac-46ec-b158-6d07a3812bc8 | Fish encounter              |
| 9b6b915d-6b66-4a97-9236-73594f2a0520 | Wildlife encounter          |
| ead419f2-0e72-4d41-9715-7833879b71a8 | Unknown                     |
| 1fc3c17d-56a4-4881-aa13-7d756b5616c5 | Trap location               |
| 8944c684-7cfc-44cf-a2d8-be66723c1ae0 | Fish Barrier                |
| 0caa52b7-dfd7-4bf6-bd99-effb17099fd3 | Reach boundary point        |
| 0e15f4e1-57a4-45e0-8ef7-f623627b03a8 | Section break point         |

### stream\_channel\_type\_lut

##### *Type of stream channel (mainstem, left braid, etc.)*

| Column name                | Data type     | Nullable? | Key     | Description                            |
|:---------------------------|:--------------|:----------|:--------|:---------------------------------------|
| stream\_channel\_type\_id  | uuid          | No        | Primary | Globally unique primary key            |
| channel\_type\_description | varchar (100) | No        |         | Description of the stream channel type |

| stream\_channel\_type\_id            | channel\_type\_description          |
|:-------------------------------------|:------------------------------------|
| aab84316-5477-47a5-ac9a-064f0013b31e | Left braid when looking downstream  |
| 713a39a5-8e95-4069-b078-066699c321d8 | No data                             |
| 458bc60e-396f-4d93-978a-0ad47488de56 | Right braid when looking downstream |
| 28fb418b-95ec-4fd5-9cfc-1140a3d777fb | Middle braid                        |
| 40b0498f-db5a-4701-b651-3de869a7b549 | Artificial spawning channel         |
| 540d2361-7598-46b0-88b0-895558760c52 | Not applicable                      |
| 57298ff7-40c6-44c4-9a47-eda0b7c7ba94 | Mainstem                            |

### location\_orientation\_type\_lut

##### *Orientation of point in channel (left, right) when looking downstream*

| Column name                     | Data type     | Nullable? | Key     | Description                     |
|:--------------------------------|:--------------|:----------|:--------|:--------------------------------|
| location\_orientation\_type\_id | uuid          | No        | Primary | Globally unique primary key     |
| orientation\_type\_description  | varchar (100) | No        |         | Description of orientation type |

| location\_orientation\_type\_id      | orientation\_type\_description               |
|:-------------------------------------|:---------------------------------------------|
| 2f34e3d6-3c76-4283-84e8-2b0f0e9a2c06 | Mid-channel                                  |
| 797b23e7-0a06-4103-9a9d-3ea11e5efe44 | Right of mid-channel when looking downstream |
| eb4652b7-5390-43d4-a98e-60ea54a1d518 | No data                                      |
| 88875c3a-0840-4da4-884e-611dc5f71dc3 | Right bank when looking downstream           |
| af8ff80d-ea66-46fb-98e5-8cc93e1f1858 | Left bank when looking downstream            |
| ffdeeb40-11c8-4268-a2a5-bd73dedd8c25 | Not applicable                               |
| 7fe4e88e-39fc-4f9f-b863-cf811b7ef3d8 | Left of mid-channel when looking downstream  |

Location\_source
================

##### *Methods of capture, and errors, associated with point locations*

| Column name                           | Data type       | Nullable? | Key     | Description                                  |
|:--------------------------------------|:----------------|:----------|:--------|:---------------------------------------------|
| location\_source\_id                  | uuid            | No        | Primary | Globally unique primary key                  |
| location\_id                          | uuid            | No        | Foreign | Link to location table                       |
| coordinate\_capture\_method\_id       | uuid            | No        | Foreign | Methods used to capture point locations      |
| location\_error\_type\_id             | uuid            | No        | Foreign | Error types associated with point locations  |
| location\_error\_correction\_type\_id | uuid            | No        | Foreign | Methods to correct point location errors     |
| latitude\_decimal\_degree\_wgs84      | numeric (12, 9) | Yes       |         | Original uncorrected latitude                |
| longitude\_decimal\_degree\_wgs84     | numeric (14, 9) | Yes       |         | Original uncorrected longitude               |
| elevation\_meter                      | numeric (6, 1)  | Yes       |         | Elevation in meters above sea-level          |
| location\_correction\_layer\_name     | varchar (50)    | Yes       |         | Name of GIS layer used for corrections       |
| waypoint\_name                        | varchar (50)    | Yes       |         | Name of waypoint                             |
| waypoint\_datetime                    | timestamptz (6) | Yes       |         | Time that waypoint was recorded              |
| comment\_text                         | varchar (2000)  | Yes       |         | Additional comments regarding point location |

### coordinate\_capture\_method\_lut

##### *Methods used to capture point location*

| Column name                     | Data type     | Nullable? | Key     | Description                                  |
|:--------------------------------|:--------------|:----------|:--------|:---------------------------------------------|
| coordinate\_capture\_method\_id | uuid          | No        | Primary | Globally unique primary key                  |
| capture\_method\_description    | varchar (100) | No        |         | Description of point location capture method |

| coordinate\_capture\_method\_id      | capture\_method\_description                                                   |
|:-------------------------------------|:-------------------------------------------------------------------------------|
| 80a38743-319e-47f4-9b12-01cfb3451618 | Realtime GPS waypoint captured at actual location                              |
| 80443963-b49f-4f3f-a02c-4382a3e91988 | Realtime waypoint derived from GPS track and synced to timestamp               |
| ea9d8dca-19cb-4479-81b7-7b5b79d8cad1 | No method recorded                                                             |
| 469b88f1-8158-4dcd-ab5a-a2ce48fcb0db | Realtime waypoint extracted from EXIF file of geotagged image                  |
| 13ad421e-63a2-43fb-8dae-bf018ef9bfa1 | Realtime GIS waypoint captured near actual location by manual placement on map |
| c32957ac-b89d-4728-8db4-d8b611e7cb7a | Post-survey waypoint manually placed using GIS. Location is a best estimate.   |

### location\_error\_type\_lut

##### *Error types associated with point locations*

| Column name                        | Data type     | Nullable? | Key     | Description                 |
|:-----------------------------------|:--------------|:----------|:--------|:----------------------------|
| location\_error\_type\_id          | uuid          | No        | Primary | Globally unique primary key |
| location\_error\_type\_code        | varchar (4)   | No        |         | Short code for error type   |
| location\_error\_type\_description | varchar (200) | No        |         | Description of error type   |

| location\_error\_type\_id            | location\_error\_type\_code | location\_error\_type\_description    |
|:-------------------------------------|:----------------------------|:--------------------------------------|
| c44b6f7e-08f7-4138-932b-3284bd266bf8 | EPE                         | Estimated positional error - accuracy |
| 6d1febb2-8ce5-4ca5-a8ee-6230e93c9620 | HDOP                        | Horizontal Dilution of Precision      |
| 75f9685d-d52e-40c6-8c62-62b110882b28 | MOD                         | Point modification process error      |
| c86441f5-1abd-49e6-9aca-6a7d5d1b7ed1 | PDOP                        | Position Dilution of Precision        |

### location\_error\_correction\_type\_lut

##### *Methods used to correct point location errors*

| Column name                           | Data type     | Nullable? | Key     | Description                             |
|:--------------------------------------|:--------------|:----------|:--------|:----------------------------------------|
| location\_error\_correction\_type\_id | uuid          | No        | Primary | Globally unique primary key             |
| correction\_type\_short\_description  | varchar (50)  | No        |         | Short description of correction methods |
| correction\_type\_description         | varchar (200) | No        |         | Full description of correction methods  |

| location\_error\_correction\_type\_id | correction\_type\_short\_description | correction\_type\_description                                                               |
|:--------------------------------------|:-------------------------------------|:--------------------------------------------------------------------------------------------|
| d53d76c0-967f-4f00-9030-08815c9689f7  | Equidistant                          | Point placed equidistant between two known points                                           |
| 5a450122-a02b-419d-9675-1eb94d7b501f  | Manual placement                     | Point manually placed and snapped to stream when snapping tolerance exceeds 40 ft.          |
| f5a1ac7f-1e51-45b9-bb3f-3ad7ae27e81a  | Professional judgement               | Point manually placed and snapped to stream based on field notes or interview with surveyor |
| 74c005b7-5c85-461c-9524-c09f16768221  | Snapped                              | Point autosnapped to stream when snapping tolerance within 40 ft.                           |

Fish\_capture
=============

##### *Attributes for capture type surveys (traps, electrofishing)*

| Column name                 | Data type       | Nullable? | Key     | Description                                   |
|:----------------------------|:----------------|:----------|:--------|:----------------------------------------------|
| fish\_capture\_id           | uuid            | No        | Primary | Globally unique primary key                   |
| survey\_id                  | uuid            | No        | Foreign | Link to survey table                          |
| gear\_performance\_type\_id | uuid            | No        | Foreign | Link to categories for capture gear integrity |
| fish\_start\_datetime       | timestamptz (6) | Yes       |         | Time when capture gear started fishing        |
| fish\_end\_datetime         | timestamptz (6) | Yes       |         | Time when capture gear stopped fishing        |

### gear\_performance\_type\_lut

##### *Categories for how well capture gear is functioning*

| Column name                     | Data type     | Nullable? | Key     | Description                                      |
|:--------------------------------|:--------------|:----------|:--------|:-------------------------------------------------|
| gear\_performance\_type\_id     | uuid          | No        | Primary | Globally unique primary key                      |
| performance\_short\_description | varchar (50)  | No        |         | Short description of capture gear performance    |
| performance\_description        | varchar (200) | No        |         | Detailed description of capture gear performance |

| gear\_performance\_type\_id          | performance\_short\_description | performance\_description                                           |
|:-------------------------------------|:--------------------------------|:-------------------------------------------------------------------|
| 249f4e53-432c-419c-af50-0095b5bb1a83 | Gear damaged, not fishing       | Gear not operational, allowing fish to get past                    |
| d372209f-965c-4eba-bae3-03242935d0d6 | Gear partially intact           | Gear not fully operational. Potentially allowing fish to get past. |
| 08a9d6e1-1a1a-418f-9034-39e08fdb5f2d | Gear intact                     | Gear fully operational and not allowing fish to get past           |
| 63cf84ea-a7b4-4e30-997f-4a41d237fe59 | No data                         | No data recorded                                                   |
| b96f22c1-14b6-48dd-aafb-79ed6f02e1fc | Gear intact, but not fishing    | Gear intact but not fishing as intended. Allowing fish to get past |

Fish\_barrier
=============

##### *Attributes for fish barriers encountered during surveys*

| Column name                   | Data type       | Nullable? | Key     | Description                                        |
|:------------------------------|:----------------|:----------|:--------|:---------------------------------------------------|
| fish\_barrier\_id             | uuid            | No        | Primary | Globally unique primary key                        |
| survey\_id                    | uuid            | No        | Foreign | Link to survey table                               |
| barrier\_location\_id         | uuid            | No        | Foreign | Link to location table, describes barrier location |
| barrier\_type\_id             | uuid            | No        | Foreign | Link to table listing barrier categories           |
| barrier\_observed\_datetime   | timestamptz (6) | Yes       |         | Time that barrier was observed                     |
| barrier\_height\_meter        | numeric (4, 2)  | Yes       |         | Height of barrier in meters                        |
| barrier\_height\_type\_id     | uuid            | No        | Foreign | Link to barrier\_measurement\_type table           |
| plunge\_pool\_depth\_meter    | numeric (4, 2)  | Yes       |         | Depth of barrier plunge pool in meters             |
| plunge\_pool\_depth\_type\_id | uuid            | No        | Foreign | Link to barrier\_measurement\_type table           |
| comment\_text                 | varchar (2000)  | Yes       |         | Additional comments on fish barrier                |

### barrier\_type\_lut

##### *Categories for types of barriers encountered during surveys*

| Column name                | Data type    | Nullable? | Key     | Description                 |
|:---------------------------|:-------------|:----------|:--------|:----------------------------|
| barrier\_type\_id          | uuid         | No        | Primary | Globally unique primary key |
| barrier\_type\_description | varchar (50) | No        |         | Description of barrier type |

| barrier\_type\_id                    | barrier\_type\_description |
|:-------------------------------------|:---------------------------|
| ab494f43-4771-4c9c-990c-11733db71c49 | High water line            |
| 71f60180-d53f-45ec-8cae-1c484f899530 | Dam                        |
| c440240e-ac6b-488e-a920-2578082ee2c9 | Log jam                    |
| 4dbe30db-52d5-42b6-ad96-541e657d8374 | Culvert                    |
| 27adfde5-a3b6-4411-be01-d593e9fd02f6 | Other                      |
| 25250be2-6c97-4a77-9d1d-df123c32e7ca | Beaver dam                 |
| 0731c4c4-810d-4de6-9649-e0db43207eb3 | Waterfall                  |
| 21b16ab6-8f54-4dee-b66a-ff97b7a21895 | Screen                     |

### barrier\_measurement\_type\_lut

##### *Measurement type for barrier height and pool depth*

| Column name                    | Data type    | Nullable? | Key     | Description                                  |
|:-------------------------------|:-------------|:----------|:--------|:---------------------------------------------|
| barrier\_measurement\_type\_id | uuid         | No        | Primary | Globally unique primary key                  |
| measurement\_type\_description | varchar (50) | No        |         | Measurement type (measured, estimated, etc.) |

| barrier\_measurement\_type\_id       | measurement\_type\_description |
|:-------------------------------------|:-------------------------------|
| bb48e2b1-56f9-4442-acf5-13dae500b27e | Unknown                        |
| 6352ee46-9d51-4849-919c-4ad37acf2150 | Measured                       |
| 95e6627b-93c9-4e94-b89b-d1e1789ae699 | Estimated                      |

Fish\_species\_presence
=======================

##### *Data on species presence-absence observations*

| Column name                 | Data type      | Nullable? | Key     | Description                                           |
|:----------------------------|:---------------|:----------|:--------|:------------------------------------------------------|
| fish\_species\_presence\_id | uuid           | No        | Primary | Globally unique primary key                           |
| survey\_id                  | uuid           | No        | Foreign | Link to survey table                                  |
| species\_id                 | uuid           | No        | Foreign | Link to species table                                 |
| fish\_presence\_type\_id    | uuid           | No        | Foreign | Link to categories of likelihood for species presence |
| comment\_text               | varchar (1000) | Yes       |         | Additional comment on fish presence or absence        |

### species\_lut

##### *List of fish species*

| Column name   | Data type    | Nullable? | Key     | Description                       |
|:--------------|:-------------|:----------|:--------|:----------------------------------|
| species\_id   | uuid         | No        | Primary | Globally unique primary key       |
| species\_code | varchar (4)  | No        |         | Short code for species            |
| common\_name  | varchar (75) | No        |         | Common name of species            |
| genus         | varchar (75) | Yes       |         | The genus name for the fish       |
| species       | varchar (50) | Yes       |         | The species name for the fish     |
| sub\_species  | varchar (50) | Yes       |         | The sub-species name for the fish |

| species\_id                          | species\_code | common\_name              | genus         | species        | sub\_species |
|:-------------------------------------|:--------------|:--------------------------|:--------------|:---------------|:-------------|
| 7bfe6eb5-9ca8-4a6c-b89e-ff296b86a96d | Atla          | Atlantic salmon           | Salmo         | salar          |              |
| 5f940977-fde2-43c3-a94a-ee34ebb03a0b | BlkC          | Black crappie             | Pomoxis       | nigromaculatus |              |
| 89445e66-28d8-4c2c-b681-2aa0b721bbab | Bgil          | Bluegill                  | Lepomis       | macrochirus    |              |
| 4b483585-3b95-44a3-830c-e072a1b58a79 | BlpS          | Bridgelip sucker          | Catostomus    | columbianus    |              |
| 8e5ef456-ff90-4bd4-abc4-2a87b2bca020 | Bbul          | Brown bullhead            | Ameiurus      | nebulosus      |              |
| 988515cc-7a9e-49b8-8f41-59b0a295a532 | Brwn          | Brown trout               | Salmo         | trutta         |              |
| c85568c2-d1d5-439b-aef1-9d90649e36e6 | BTrt          | Bull trout                | Salvelinus    | confluentus    |              |
| 255af764-c0c2-405c-9eeb-74812030c270 | BtDV          | Bull trout - Dolly Varden | Salvelinus    | confluentus    |              |
| 69b1a91a-14f0-427f-86a6-2d723f89b0d2 | Ccat          | Channel catfish           | Ictalurus     | punctatus      |              |
| e42aa0fc-c591-4fab-8481-55b0df38dcb1 | Chin          | Chinook salmon            | Oncorhynchus  | tshawytscha    |              |
| 69d1348b-7e8e-4232-981a-702eda20c9b1 | Chum          | Chum salmon               | Oncorhynchus  | keta           |              |
| 3fcc4740-ffe7-43a2-8143-af22051de397 | CCut          | Coastal cutthroat trout   | Oncorhynchus  | clarkii        | clarkii      |
| a0f5b3af-fa07-449c-9f02-14c5368ab304 | Coho          | Coho salmon               | Oncorhynchus  | kisutch        |              |
| 8ee93878-8d89-4cde-8645-3ed71a19a016 | CCrp          | Common carp               | Cyprinus      | carpio         | carpio       |
| 99791175-94d8-4b0b-bb15-85e85e649bae | Cutt          | Cutthroat trout           | Oncorhynchus  | clarkii        |              |
| df5e5622-fc42-4af0-a572-2aafc462976c | DVrd          | Dolly Varden              | Salvelinus    | malma          |              |
| a07fa15e-9aa7-4d52-b380-7b530ed48e3c | Ebrk          | Eastern brook trout       | Salvelinus    | fontinalus     |              |
| d28b8a27-65cb-448e-908e-aa93e0c7aa4d | Eulc          | Eulachon                  | Thaleichthys  | pacificus      |              |
| 188255ba-ff3a-49ac-b65c-b0faf503f480 | GStr          | Green sturgeon            | Acipenser     | medirostris    |              |
| 3ebf0024-cae4-4d57-9931-209b57f292e8 | Koka          | Kokanee                   | Oncorhynchus  | nerka          |              |
| 26488335-e8d0-4dbd-a698-5be91b5b28a0 | LmBs          | Largemouth bass           | Micropterus   | salmoides      |              |
| a7caf7c8-5169-47db-ab94-f96c220287be | LSSu          | Largescale sucker         | Catostomus    | macrocheilus   |              |
| b5af4dc2-ebb3-4a71-b94a-77bb3b1a3725 | Masu          | Masu salmon               | Oncorhynchus  | masou          |              |
| 53645e1f-1d48-46d9-a982-a32fe7291aaf | MWFs          | Mountain whitefish        | Prosopium     | williamsoni    |              |
| fa02bfed-dc74-4209-ab2a-f1ab244c88d1 | Npik          | Northern pike             | Esox          | lucius         |              |
| 8218da4e-ce75-42f9-81ac-f4ee80ce4080 | NPkm          | Northern pikeminnow       | Ptychocheilus | oregonensis    |              |
| 2afac5a6-e3b9-4b37-911e-59b93240789d | PLmp          | Pacific lamprey           | Lampetra      | tridentata     |              |
| d7ac0fb8-e4f4-4659-a221-65ba9e4055af | Pmth          | Peamouth                  | Mylocheilus   | caurinus       |              |
| ab60e8c0-4772-4249-90da-071ffb689f85 | Pink          | Pink salmon               | Oncorhynchus  | gorbuscha      |              |
| ca1dee5c-5bcc-49c5-8c67-c7ac8105bdbc | Psed          | Pumpkinseed               | Lepomis       | gibbosus       |              |
| 8e5c06ee-80b8-4004-8d14-c220378353b9 | RnBw          | Rainbow trout             | Oncorhynchus  | mykiss         |              |
| d4ffc92a-9b2f-4260-94ec-a28fd75ddcd0 | RLmp          | River lamprey             | Lampetra      | ayresi         |              |
| 9b881b87-ee50-4de3-a3e9-a16950b9f8be | Scul          | Sculpin                   | Cottus        | spp.           |              |
| 9ddfa4d4-8674-4eca-8d34-ab9bbeb06b11 | SmBs          | Smallmouth bass           | Micropterus   | dolomieui      |              |
| ed78e286-78d9-451b-854a-e3b89b2d6fd6 | Sock          | Sockeye salmon            | Oncorhynchus  | nerka          |              |
| aa9f07cf-91f8-4244-ad17-7530b8cd1ce1 | Sthd          | Steelhead trout           | Oncorhynchus  | mykiss         |              |
| b4cebadc-6563-4201-8fe0-91ceb6838cea | ThrS          | Threespine stickleback    | Gasterosteus  | aculeatus      | aculeatus    |
| b66dc216-c8c5-47a1-9b8b-e565b51b9f23 | TrUn          | Trout, unknown species    |               |                |              |
| f3ffc4c5-5e0a-4a37-9b0d-fae9fa946423 | Unkn          | Unknown                   |               |                |              |
| 6eb941e0-abb6-438f-b58f-ec2c6c6142b8 | Waly          | Walleye                   | Stizostedion  | vitreum        |              |
| d29ca246-acfa-48d5-ba55-e61323d59fa7 | WBLp          | Western brook lamprey     | Lampetra      | richardsonii   |              |
| 1035603d-b1f5-42da-bc31-32f5d1d5271a | Wcut          | Westslope cutthroat trout | Oncorhynchus  | clarki         | clarki       |
| f3c101dc-7740-44e6-a88e-9fc837a34ed1 | WStr          | White sturgeon            | Acipenser     | transmontanus  |              |
| 31ead0b6-abcb-4e3c-97e4-f1c919c7e0bb | Ypch          | Yellow perch              | Perca         | flavescens     |              |

### fish\_presence\_type\_lut

##### *Categories of likelihood for presence of fish species*

| Column name                       | Data type     | Nullable? | Key     | Description                        |
|:----------------------------------|:--------------|:----------|:--------|:-----------------------------------|
| fish\_presence\_type\_id          | uuid          | No        | Primary | Globally unique primary key        |
| fish\_presence\_type\_description | varchar (100) | No        |         | Description of presence likelihood |

| fish\_presence\_type\_id             | fish\_presence\_type\_description                        |
|:-------------------------------------|:---------------------------------------------------------|
| b041a8d7-cc27-4165-8ca7-4c323ef48285 | Presence confirmed                                       |
| 71e381ff-1131-4f70-be6e-513ed38458a3 | Presence likely but species identification not confirmed |
| ae038884-838b-4c37-ace4-95ce5593ea38 | No evidence of presence                                  |
| 60dc4b7e-583e-42b7-952c-e54ff3f4cf22 | Evidence suggests presence unlikely                      |

Stream\_measurement
===================

##### *Measurements of stream attributes captured during surveys*

| Column name                         | Data type       | Nullable? | Key     | Description                             |
|:------------------------------------|:----------------|:----------|:--------|:----------------------------------------|
| stream\_measurement\_id             | uuid            | No        | Primary | Globally unique primary key             |
| survey\_id                          | uuid            | No        | Foreign | Link to survey table                    |
| water\_clarity\_type\_id            | uuid            | No        | Foreign | Description of clarity measurement type |
| water\_clarity\_meter               | numeric (4, 2)  | Yes       |         | Clarity measurement in meters           |
| stream\_flow\_measurement\_cfs      | int4            | Yes       |         | Stream flow in cubic feet per second    |
| start\_water\_temperature\_datetime | timestamptz (6) | Yes       |         | Time when temperature was measured      |
| start\_water\_temperature\_celsius  | numeric (4, 1)  | Yes       |         | Water temperature at start of survey    |
| end\_water\_temperature\_datetime   | timestamptz (6) | Yes       |         | Time when temperature was measured      |
| end\_water\_temperature\_celsius    | numeric (4, 1)  | Yes       |         | Water temperature at end of survey      |
| stream\_ph\_measurement             | numeric (2, 1)  | Yes       |         | Water pH measurement                    |

### water\_clarity\_type\_lut

##### *Description of water clarity measurement type*

| Column name                       | Data type     | Nullable? | Key     | Description                                         |
|:----------------------------------|:--------------|:----------|:--------|:----------------------------------------------------|
| water\_clarity\_type\_id          | uuid          | No        | Primary | Globally unique primary key                         |
| clarity\_type\_short\_description | varchar (50)  | No        |         | Short description of clarity measurement type       |
| clarity\_type\_description        | varchar (200) | No        |         | Detailed description of of clarity measurement type |

| water\_clarity\_type\_id             | clarity\_type\_short\_description      | clarity\_type\_description                                                                                     |
|:-------------------------------------|:---------------------------------------|:---------------------------------------------------------------------------------------------------------------|
| 37d458a2-7dc9-48a3-92c3-dd7928a4dc53 | Actual depth greater than measured     | Too deep to measure. Value represents maximum depth that could be measured. True value is greater.             |
| 282d8ea4-4e78-4c4d-be05-dfd7fa457c09 | No data                                | Measurement protocol not defined                                                                               |
| 03f7595f-1a18-47a2-ae5c-e5e817a25080 | Measured from surface to stream bottom | Surveyor could see to the bottom for the entire reach. Clarity value represents the maximum depth encountered. |
| ad71c310-3d86-41bd-8b86-ff76f6373c94 | Actual depth measurement               | Value reflects the true vertical clarity for the survey.                                                       |

Survey\_comment
===============

##### *Comments on survey. Largely derived from legacy comment codes*

| Column name                    | Data type      | Nullable? | Key     | Description                                            |
|:-------------------------------|:---------------|:----------|:--------|:-------------------------------------------------------|
| survey\_comment\_id            | uuid           | No        | Primary | Globally unique primary key                            |
| survey\_id                     | uuid           | No        | Foreign | Link to survey table                                   |
| area\_surveyed\_id             | uuid           | No        | Foreign | Description of areas surveyed or excluded              |
| fish\_abundance\_condition\_id | uuid           | No        | Foreign | Factors affecting abundance (fish kill, predation, etc |
| survey\_count\_condition\_id   | uuid           | No        | Foreign | Factors affecting ability to count fish                |
| survey\_timing\_id             | uuid           | No        | Foreign | Comments on run timing                                 |
| stream\_condition\_id          | uuid           | No        | Foreign | Factors affecting fish migration or passage            |
| weather\_type\_id              | uuid           | No        | Foreign | General comments on weather conditions                 |
| visibility\_condition\_id      | uuid           | No        | Foreign | Factors affecting visibility below stream surface      |
| stream\_flow\_type\_id         | uuid           | No        | Foreign | General comments on stream flow                        |
| survey\_visibility\_type\_id   | uuid           | No        | Foreign | General comments on visibility                         |
| comment\_text                  | varchar (2000) | Yes       |         | Additional comments on survey                          |

### area\_surveyed\_lut

##### *Descriptions of areas surveyed or excluded (from comment codes)*

| Column name        | Data type    | Nullable? | Key     | Description                               |
|:-------------------|:-------------|:----------|:--------|:------------------------------------------|
| area\_surveyed\_id | uuid         | No        | Primary | Globally unique primary key               |
| area\_surveyed     | varchar (50) | No        |         | Description of areas surveyed or excluded |

| area\_surveyed\_id                   | area\_surveyed              |
|:-------------------------------------|:----------------------------|
| 2e42d026-7c74-4eea-bfab-0e1d00778304 | Intertidal                  |
| 7ecc1a9d-e932-48df-8ee2-3ffb94733ac8 | Partial survey              |
| 25547551-5ae2-4c2e-88ff-4a277eff725f | Includes area below index   |
| 4f10c5b9-7e06-4014-82fe-5669810cebf8 | Holes not surveyed          |
| 513c834b-b284-49a2-b75c-72419124bfb9 | Includes area above index   |
| fe53594d-f336-4acc-b95f-91dff83900d9 | Includes tributary in index |
| c66c9def-873b-4dee-b7c6-9aa8afed6043 | Right bank survey           |
| 9576e748-0ffb-4ca9-8130-af97b61e98e3 | Left bank side channel      |
| 267f7308-48ed-4235-bb29-c93d4e1dcda2 | Right bank side channel     |
| a934ff9f-bd29-449d-8e18-dd0fc0d93565 | Left bank survey            |

### fish\_abundance\_condition\_lut

##### *Factors affecting fish abundance (from comment codes)*

| Column name                    | Data type    | Nullable? | Key     | Description                           |
|:-------------------------------|:-------------|:----------|:--------|:--------------------------------------|
| fish\_abundance\_condition\_id | uuid         | No        | Primary | Globally unique primary key           |
| fish\_abundance\_condition     | varchar (50) | No        |         | Description of fish abundance factors |

| fish\_abundance\_condition\_id       | fish\_abundance\_condition |
|:-------------------------------------|:---------------------------|
| f0ba56da-c8d1-4198-950e-3ed66e736266 | Heavy predation            |
| 19ed196c-0042-461f-b86f-48b381bef51a | Light predation            |
| fe0d484e-52f2-4b3e-8ae6-6317a837628c | Fish kill                  |
| de96218a-baa3-43ed-889d-655a6201fb47 | Heavy poaching             |
| 116729cc-0941-4316-be1c-730344488676 | Light poaching             |
| 966f156b-23dd-4b47-8c6e-f93b08b2435e | Illegal setnetting         |

### survey\_count\_condition\_lut

##### *Factors affecting ability to count fish (from comment codes)*

| Column name                  | Data type    | Nullable? | Key     | Description                             |
|:-----------------------------|:-------------|:----------|:--------|:----------------------------------------|
| survey\_count\_condition\_id | uuid         | No        | Primary | Globally unique primary key             |
| survey\_count\_condition     | varchar (50) | No        |         | Factors affecting ability to count fish |

| survey\_count\_condition\_id         | survey\_count\_condition               |
|:-------------------------------------|:---------------------------------------|
| f254f2f6-8f81-49b5-9a9c-30b0efefbe7e | Partial count                          |
| c347c57e-d323-4a98-8001-78a65f11eed0 | Count in holes estimated               |
| c6ec9a75-6911-4cb3-b8d0-aaa71e2cc089 | Most carcasses have been washed out    |
| d858051f-e7b2-4771-b465-bc41c1614b3a | Actual dead count higher than recorded |

### survey\_timing\_lut

##### *Comments on run timing (from comment codes)*

| Column name        | Data type    | Nullable? | Key     | Description                 |
|:-------------------|:-------------|:----------|:--------|:----------------------------|
| survey\_timing\_id | uuid         | No        | Primary | Globally unique primary key |
| survey\_timing     | varchar (50) | No        |         | Comments on run timing      |

| survey\_timing\_id                   | survey\_timing                 |
|:-------------------------------------|:-------------------------------|
| f0fcd761-acdd-4bf5-bdf7-32719b59ac11 | Middle run                     |
| 42c8df08-f237-464e-8dde-33da6ca7902e | Early run                      |
| 4cb84c6e-92f6-42c8-ab59-9865d094642e | Survey too late - after peak   |
| 0e4caa01-5453-4e58-9f20-c9cb602cd261 | Survey too early - before peak |
| 0197d4ae-97f2-4df1-8a5e-ca221cb1bdec | Late run                       |
| fb2edab8-3fb3-48b8-ad03-de0b5e4f700a | Peak survey                    |

### stream\_condition\_lut

##### *Factors affecting fish migration or passage (from comment codes)*

| Column name           | Data type    | Nullable? | Key     | Description                      |
|:----------------------|:-------------|:----------|:--------|:---------------------------------|
| stream\_condition\_id | uuid         | No        | Primary | Globally unique primary key      |
| stream\_condition     | varchar (50) | No        |         | Description of stream conditions |

| stream\_condition\_id                | stream\_condition             |
|:-------------------------------------|:------------------------------|
| 4a030847-289e-4af5-af91-0458b17c83fe | Passable beaver dam           |
| f656241a-885c-44c6-b237-17874443c40d | Evidence of scouring          |
| 7566ceae-1340-48b1-9afc-2d4e238b4f99 | Impassable log jam            |
| c85a862f-7415-40b8-ac8d-39989c6830c9 | Exposed redds due to low flow |
| a23dcd01-4b84-470c-a8c0-3b6d0402c39b | Damaging bank work            |
| 0e9bbad1-d6ac-4be6-8ec9-5044d88f37e4 | Passable log jam              |
| 21d11d8d-94b0-4680-8a17-ba4f37074a58 | Heavy siltation               |
| 618c6df9-76a0-4ea0-bcde-bf51851bebae | Damaging channel work         |
| 07951665-03f7-416a-abde-cc47ba5e6f25 | Damaging diversion            |
| e158d5d6-4ced-4213-9056-ceb93c91d892 | Impassable beaver dam         |
| b09bd8d0-cb7a-42d4-9335-dddda8f2d370 | Man-made block                |
| d33e41c2-d52b-416c-81b1-eacfa02f7ec6 | Recent habitat alteration     |

### weather\_type\_lut

##### *General comments on weather conditions*

| Column name                | Data type    | Nullable? | Key     | Description                            |
|:---------------------------|:-------------|:----------|:--------|:---------------------------------------|
| weather\_type\_id          | uuid         | No        | Primary | Globally unique primary key            |
| weather\_type\_description | varchar (50) | No        |         | General comments on weather conditions |

| weather\_type\_id                    | weather\_type\_description |
|:-------------------------------------|:---------------------------|
| c69db1a2-b23e-4b19-a01f-04c49146a0d5 | Sunny                      |
| e65db509-7ecd-449f-9fc9-1198b16f17ed | Raining                    |
| 5c5a4f72-762b-44c2-bb08-170cf1fe08a2 | Windy                      |
| 03600929-f6a0-4ae4-96cc-22a32b4154ed | No data                    |
| ee73687b-fef1-47c7-a359-7655e47b6030 | Showers                    |
| 112ef915-4320-44cd-8018-c0c9aaa58b77 | Cloudy                     |
| d0c26c71-c851-4a38-8a7b-c536b12cdd1d | Snowing                    |

### visibility\_condition\_lut

##### *Factors affecting visibility below stream surface (from comment codes)*

| Column name               | Data type    | Nullable? | Key     | Description                                       |
|:--------------------------|:-------------|:----------|:--------|:--------------------------------------------------|
| visibility\_condition\_id | uuid         | No        | Primary | Globally unique primary key                       |
| visibility\_condition     | varchar (50) | No        |         | Factors affecting visibility below stream surface |

| visibility\_condition\_id            | visibility\_condition |
|:-------------------------------------|:----------------------|
| 86529627-3576-4784-977f-39df1e8a5c3d | Some glare            |
| 57b6c0c7-b86f-4857-8109-5df203161044 | Water turbid          |
| 817d7782-8660-40c2-af5e-a5d58dc9f9d8 | Dark                  |
| 931739d1-8661-4537-8783-a667c8c3940c | Dark in pools         |
| 3a5caeb4-d836-4499-9659-b7d9962136e6 | High glare            |

### stream\_flow\_type\_lut

##### *General comments on stream flow*

| Column name                    | Data type     | Nullable? | Key     | Description                           |
|:-------------------------------|:--------------|:----------|:--------|:--------------------------------------|
| stream\_flow\_type\_id         | uuid          | No        | Primary | Globally unique primary key           |
| flow\_type\_short\_description | varchar (25)  | No        |         | Short description of stream flow type |
| flow\_type\_description        | varchar (100) | No        |         | Full description of stream flow type  |

| stream\_flow\_type\_id               | flow\_type\_short\_description | flow\_type\_description             |
|:-------------------------------------|:-------------------------------|:------------------------------------|
| 4ae8ee9e-b81a-4eb1-b3c3-01d490c25e48 | Medium-low                     | Medium low water flow.              |
| 7eebbec4-db9e-4fc1-b8b2-0f47171dd603 | Frozen                         | Stream frozen solid. No water flow. |
| d30612c5-a0ad-493b-8936-1d73fcd27436 | High                           | High water flow.                    |
| 537d84d4-6a87-4dae-8a80-25a83098db07 | Dry                            | Streambed dry with no water.        |
| 35b44344-8f75-4347-9238-80720b70c306 | Medium-high                    | Medium high water flow.             |
| 2cb32c13-64cc-4fdd-81d1-9f46741903db | Medium                         | Medium water flow.                  |
| 3dc8dd96-c9c1-4a94-83b4-ba9b7765d103 | Flooding                       | Water above flood stage.            |
| e582ef16-92cc-4634-8fa9-d4552eed9321 | Partly frozen                  | Stream partly frozen.               |
| 2de5210f-0116-45ae-9664-ea4470f9e162 | Low                            | Low water flow.                     |

### survey\_visibility\_type\_lut

##### *General comments on survey visibility*

| Column name                          | Data type     | Nullable? | Key     | Description                          |
|:-------------------------------------|:--------------|:----------|:--------|:-------------------------------------|
| survey\_visibility\_type\_id         | uuid          | No        | Primary | Globally unique primary key          |
| visibility\_type\_short\_description | varchar (50)  | No        |         | Short description of visibility type |
| visibility\_type\_description        | varchar (200) | No        |         | Full description of visibility type  |

| survey\_visibility\_type\_id         | visibility\_type\_short\_description | visibility\_type\_description                                             |
|:-------------------------------------|:-------------------------------------|:--------------------------------------------------------------------------|
| 43a84d5d-48ab-4390-94db-20a44870f0db | Very good                            | Visibility conditions had only minor impact on counts                     |
| c46b1a49-e1c6-4eda-aab6-42765d943a81 | Fair                                 | Visibility conditions had moderate to substantial impact on counts        |
| b84b76f6-f8fd-4e3d-9672-64c8e9b11f2e | Excellent                            | Visibility conditions had no impact on counts                             |
| 1d129092-2099-4989-93ef-79c105f3f801 | Not surveyable                       | Visibility conditions sufficiently poor that no survey could be conducted |
| ae62e25b-517b-4de5-971c-94dae4806948 | Good                                 | Visibility conditions had moderate impact on counts                       |
| 06d02d87-fb64-4246-91c0-f45e3cc8ea5d | Unknown                              | Unknown to what degree visibility conditions impacted counts              |
| 32701e7b-1bb6-4109-9b63-f9219cda4614 | Poor                                 | Visibility conditions had substantial impact on counts                    |

Survey\_intent
==============

##### *Predetermined intent of the survey in terms of species targeted and count types attempted (live, dead, redd)*

| Column name        | Data type | Nullable? | Key     | Description                 |
|:-------------------|:----------|:----------|:--------|:----------------------------|
| survey\_intent\_id | uuid      | No        | Primary | Globally unique primary key |
| survey\_id         | uuid      | No        | Foreign |                             |
| species\_id        | uuid      | No        | Foreign |                             |
| count\_type\_id    | uuid      | No        | Foreign |                             |

### count\_type\_lut

##### *Intended count types (live fish, dead fish, redds, etc.)*

| Column name              | Data type     | Nullable? | Key     | Description                               |
|:-------------------------|:--------------|:----------|:--------|:------------------------------------------|
| count\_type\_id          | uuid          | No        | Primary | Globally unique primary key               |
| count\_type\_code        | varchar (6)   | No        |         | Short code for count type categories      |
| count\_type\_description | varchar (100) | No        |         | Full description of count type categories |

| count\_type\_id                      | count\_type\_code | count\_type\_description                                                                      |
|:-------------------------------------|:------------------|:----------------------------------------------------------------------------------------------|
| 7a785819-3a9f-4728-88db-7e77e580cd41 | COMP              | Complete survey attempted. Live, dead, and redd counts, plus sampling of carcasses            |
| 0e1980b4-aa59-4e8e-a820-ce5e4629a549 | CNTO              | Only counts attempted. Counts of redds and all live and dead fish, but no carcass sampling    |
| 68a9427b-c856-4751-a7ea-e35b515a36d7 | CARC              | Only carcass counts and carcass sampling attempted. No counts of live fish or redds attempted |
| a3a8dd3a-8ccd-4978-94d7-844fb0dad12c | REDD              | Only redd counts attempted                                                                    |
| ed4ec42c-fe35-42c9-bf4e-a5211aa9b3e8 | LIVE              | Only live counts attempted                                                                    |
| 2edacaa7-5098-4fec-9010-1342343fadc5 | NSRV              | No survey conducted                                                                           |
| 58a817fe-3316-408a-a20c-efa0d7390de8 | NSPEC             | Not specified                                                                                 |

Survey\_mobile\_device
======================

##### *Associative table between survey table and mobile\_device table*

| Column name                | Data type | Nullable? | Key     | Description                  |
|:---------------------------|:----------|:----------|:--------|:-----------------------------|
| survey\_mobile\_device\_id | uuid      | No        | Primary | Globally unique primary key  |
| survey\_id                 | uuid      | No        | Foreign | Link to survey table         |
| mobile\_device\_id         | uuid      | No        | Foreign | Link to mobile\_device table |

Mobile\_device
==============

##### *Stores data for tracking mobile devices*

| Column name                   | Data type       | Nullable? | Key     | Description                                 |
|:------------------------------|:----------------|:----------|:--------|:--------------------------------------------|
| mobile\_device\_id            | uuid            | No        | Primary | Globally unique primary key                 |
| mobile\_device\_type\_id      | uuid            | No        | Foreign | Type of device (Pad, GPS, etc.)             |
| mobile\_equipment\_identifier | varchar (15)    | No        |         | Typically the MEID number printed on device |
| mobile\_device\_name          | varchar (50)    | No        |         | Name of device                              |
| mobile\_device\_description   | varchar (150)   | No        |         | Description of device                       |
| active\_indicator             | bool            | No        |         | Is the device still active and being used?  |
| inactive\_datetime            | timestamptz (6) | Yes       |         | Date the device was taken out of service    |

### mobile\_device\_type\_lut

##### *Type of mobile device*

| Column name                       | Data type    | Nullable? | Key     | Description                     |
|:----------------------------------|:-------------|:----------|:--------|:--------------------------------|
| mobile\_device\_type\_id          | uuid         | No        | Primary | Globally unique primary key     |
| mobile\_device\_type\_description | varchar (50) | No        |         | Type of device (Pad, GPS, etc.) |

| mobile\_device\_type\_id             | mobile\_device\_type\_description |
|:-------------------------------------|:----------------------------------|
| 6aaf240b-29f5-49c4-95ea-6a1f42f73add | External GPS                      |
| 774129ba-6729-40df-990c-7a574b97cbab | Mobile phone                      |
| faa3e952-3c40-495a-ac6f-be5e41db50a3 | Tablet or Pad                     |
| 7e4f6bfb-81c7-42a6-adfe-f74ccd0f74be | Notebook computer                 |

Mobile\_survey\_form
====================

##### *Table for tracking source of data collected with mobile device*

| Column name                | Data type     | Nullable? | Key     | Description                                       |
|:---------------------------|:--------------|:----------|:--------|:--------------------------------------------------|
| mobile\_survey\_form\_id   | uuid          | No        | Primary | Globally unique primary key                       |
| survey\_id                 | uuid          | No        | Foreign | Link to survey table                              |
| parent\_form\_survey\_id   | int4          | No        |         | Unique ID (integer) generated in parent form      |
| parent\_form\_survey\_guid | uuid          | No        | Foreign | GUID generated in parent form                     |
| parent\_form\_name         | varchar (100) | No        |         | Name of the parent form used to record data       |
| parent\_form\_id           | varchar (40)  | No        |         | Integer ID of the parent form used to record data |

Wildlife\_encounter
===================

##### *Ancillary data on wildlife observed during survey*

| Column name                  | Data type       | Nullable? | Key     | Description                                 |
|:-----------------------------|:----------------|:----------|:--------|:--------------------------------------------|
| wildlife\_encounter\_id      | uuid            | No        | Primary | Globally unique primary key                 |
| survey\_id                   | uuid            | No        | Foreign | Link to survey table                        |
| wildlife\_location\_id       | uuid            | Yes       | Foreign | Link to location table                      |
| wildlife\_type\_id           | uuid            | No        | Foreign | Type of wildlife observered                 |
| wildlife\_observed\_datetime | timestamptz (6) | Yes       |         | Time the observation was made               |
| wildlife\_count              | int4            | Yes       |         | Number of animals for given species counted |
| comment\_text                | varchar (1000)  | Yes       |         | Additional comment on wildlife observation  |

### wildlife\_type\_lut

##### *Type of wildlife observed during survey*

| Column name        | Data type    | Nullable? | Key     | Description                 |
|:-------------------|:-------------|:----------|:--------|:----------------------------|
| wildlife\_type\_id | uuid         | No        | Primary | Globally unique primary key |
| common\_name       | varchar (50) | No        |         | Common name of the animal   |

| wildlife\_type\_id                   | common\_name |
|:-------------------------------------|:-------------|
| 9c455d72-f9fa-401f-a581-07b365f887ba | Skunk        |
| 7d58a5ff-e3ae-4dde-924f-12f8209a3f05 | Bobcat       |
| 09b1ad3d-b266-4b35-aac6-2641cb5fc739 | Squirrel     |
| 621befe8-4f5f-4a4c-8291-2ecb7d7b08d5 | Raccoon      |
| d034a482-995d-49a3-b4e2-37a1def02f4e | Elk          |
| d96f48bc-5e5d-4de8-9440-48cc9ed5949f | Porcupine    |
| 3da3516b-5ee8-42bd-a8c0-4bc019e8037a | Nutria       |
| 9c170b53-6f24-4987-81fc-561e23c3ccb4 | Black Bear   |
| 9b63628a-edd0-447c-bda4-63c311f8f6d9 | Harbor seal  |
| 0f36e30f-d607-424b-ba79-67f56f28413f | Mink         |
| 0bf501ae-cf26-4bbc-8ced-7672e1174d94 | Muskrat      |
| bc9f3a11-89eb-47be-9a7b-7a5993d0dc77 | Deer         |
| 152ffd12-1c5d-48a7-b853-80524aa4df4f | Cougar       |
| 751df7a3-cfbe-4eca-bf85-863f329bd57f | Opposum      |
| 804dcf84-f6f2-48f7-98c0-b99997a756bf | Fox          |
| 13d7ae2b-012d-45cb-92dc-bdb57d5ae90a | Beaver       |
| e9634522-00d0-4084-ab12-bfe192667de2 | Coyote       |
| f9b7f73b-3d75-40b2-b6cb-dcf3257dcacc | Otter        |
| f12b45d2-0bec-4692-a3ac-f0303c230450 | Sea lion     |

Survey\_event
=============

##### *Species level data*

| Column name                    | Data type      | Nullable? | Key     | Description                                             |
|:-------------------------------|:---------------|:----------|:--------|:--------------------------------------------------------|
| survey\_event\_id              | uuid           | No        | Primary | Globally unique primary key                             |
| survey\_id                     | uuid           | No        | Foreign | Link to survey table                                    |
| species\_id                    | uuid           | No        | Foreign | Link to count\_type categories (live, dead, redd, etc.) |
| survey\_design\_type\_id       | uuid           | No        | Foreign | Survey design implemented for given species             |
| cwt\_detection\_method\_id     | uuid           | No        | Foreign | Method used to detect coded-wire tag                    |
| run\_id                        | uuid           | No        | Foreign | Run type for species                                    |
| run\_year                      | int4           | No        |         | Run year for species                                    |
| estimated\_percent\_fish\_seen | int4           | Yes       |         | Estimated pct. of fish seen for given species           |
| comment\_text                  | varchar (2000) | Yes       |         | Additional comment on species                           |

### survey\_design\_type\_lut

##### *Survey design implemented for given species*

| Column name                       | Data type     | Nullable? | Key     | Description                       |
|:----------------------------------|:--------------|:----------|:--------|:----------------------------------|
| survey\_design\_type\_id          | uuid          | No        | Primary | Globally unique primary key       |
| survey\_design\_type\_code        | varchar (25)  | No        |         | Short code for survey design type |
| survey\_design\_type\_description | varchar (200) | No        |         | Description of survey design type |

| survey\_design\_type\_id             | survey\_design\_type\_code | survey\_design\_type\_description                                                |
|:-------------------------------------|:---------------------------|:---------------------------------------------------------------------------------|
| beb561df-9fd0-4e7d-842f-0c64a515d23b | Index                      | Index area surveyed on a regular basis                                           |
| d455abb6-e9db-49f2-abc8-2e70890f301b | Explor                     | Exploratory survey, usually performed to find the uppermost extent of spawning   |
| 943f3527-0e26-45df-8ba2-3a8c2fc039d3 | QAQC                       | Replicate survey conducted to verify counts and guage observer efficiency        |
| 88b954cb-b7a4-4946-845a-3abd86022fbb | Supp                       | Supplemental survey not counted regularly,or for areas outside of the index area |
| b91f9e90-ab53-4fae-a033-4a1037c6fde9 | Spot                       | Spot check                                                                       |
| b87d5435-f69c-49df-ba1f-658df318bd19 | Unknown                    | Unknown                                                                          |
| 4cfe3b27-7e26-4bd2-a634-b49f8355ded3 | GRTS                       | Generalized Random Tessellation Stratified Sampling methodology                  |

### cwt\_detection\_method\_lut

##### *Methods used to detect coded-wire tags*

| Column name                    | Data type    | Nullable? | Key     | Description                     |
|:-------------------------------|:-------------|:----------|:--------|:--------------------------------|
| cwt\_detection\_method\_id     | uuid         | No        | Primary | Globally unique primary key     |
| detection\_method\_description | varchar (75) | No        |         | Description of detection method |

| cwt\_detection\_method\_id           | detection\_method\_description |
|:-------------------------------------|:-------------------------------|
| 84c4f29e-9f5c-444c-a536-befd57ba40bf | Visual                         |
| 8b17f68e-c16d-4d21-8a5c-c096fb0af4a6 | Unknown                        |
| 89a9b6b4-6ea4-44c4-b2e4-e537060e73d3 | Not applicable                 |
| d2de4873-e9ab-4eda-b1a0-fb9dcc2face7 | Electronic                     |

### run\_lut

##### *Run types (fall, winter, etc.)*

| Column name             | Data type     | Nullable? | Key     | Description                         |
|:------------------------|:--------------|:----------|:--------|:------------------------------------|
| run\_id                 | uuid          | No        | Primary | Globally unique primary key         |
| run\_short\_description | varchar (75)  | No        |         | Short description of run categories |
| run\_description        | varchar (100) | No        |         | Full description of run categories  |

| run\_id                              | run\_short\_description | run\_description                                                   |
|:-------------------------------------|:------------------------|:-------------------------------------------------------------------|
| 94e1757f-b9c7-4b06-a461-17a2d804cd2f | Unknown                 | Unknown run                                                        |
| dc7f41f4-a9d3-4317-b756-1f8401d68e03 | S-Type                  | Columbia R Coho, southerly marine distribution from mouth of river |
| d9383dda-b8c2-4768-86ec-4cc8d54b124e | Landlocked              | Anadromous fish trapped in fresh water                             |
| 59e1e01f-3aef-498c-8755-5862c025eafa | Not applicable          | Does not apply to this species of fish                             |
| 00a161dd-2a2f-492f-91cd-7343a31e4d50 | Sea-run cutthroat       | Anadromous form of cutthroat trout                                 |
| 6ed37c37-e472-437e-b007-78015897ef19 | Fall early              | Early fall run                                                     |
| dc8e44b7-3cb5-4fe9-8dd9-79ff87ea7a9d | Winter late             | Late winter run                                                    |
| 84b9585c-39ce-4c1d-a857-7baa9c1b0263 | Summer                  | Summer run                                                         |
| 5b22a1ee-4a39-4075-900a-7dfbf9858d01 | N-Type                  | Columbia R Coho, northerly marine distribution from mouth of river |
| 87978b08-e8c0-4eef-b5d8-7f406738f075 | Fall tule               | Columbia River fall tule Chinook                                   |
| dc8de7ed-c825-4f3b-93d4-87fee088ac51 | Fall                    | Fall run                                                           |
| 33beaea4-f40f-4e9c-8b45-942550de36ba | Fall late               | Late fall run                                                      |
| 1b413852-b4e8-42d1-81d9-a7bc373be906 | Winter                  | Winter run                                                         |
| 2a9f3c67-aa7a-4214-87a6-af09879fc914 | Spring                  | Spring run                                                         |
| a970ef55-9da6-44d3-beef-c8afc339a561 | Resident                | Resident group                                                     |
| cbc89464-a298-439d-8081-d9b038016030 | Fall bright             | Columbia River fall bright Chinook                                 |

Fish\_encounter\_event
======================

##### *Data for fish encounters, includes data for one or multiple fish*

| Column name                    | Data type       | Nullable? | Key     | Description                                        |
|:-------------------------------|:----------------|:----------|:--------|:---------------------------------------------------|
| fish\_encounter\_event\_id     | uuid            | No        | Primary | Globally unique primary key                        |
| survey\_event\_id              | uuid            | No        | Foreign | Link to survey\_event table                        |
| fish\_location\_id             | uuid            | Yes       | Foreign | Link to location table                             |
| fish\_status\_id               | uuid            | No        | Foreign | Status of fish when counted (live, dead)           |
| sex\_id                        | uuid            | No        | Foreign | Sex of fish (male, female, unknown, etc)           |
| maturity\_id                   | uuid            | No        | Foreign | Maturity status of fish (adult, etc.)              |
| origin\_id                     | uuid            | No        | Foreign | Origin type for species (hatchery, natural, etc.)  |
| cwt\_detection\_status\_id     | uuid            | No        | Foreign | Were coded-wire tags detected?                     |
| adipose\_clip\_status\_id      | uuid            | No        | Foreign | Status of adipose fins (clipped, unknown, etc)     |
| fish\_behavior\_type\_id       | uuid            | No        | Foreign | Behavior type (holding, spawning, etc.)            |
| mortality\_type\_id            | uuid            | No        | Foreign | How did fish die? (gear encounter, handling, etc.) |
| fish\_encounter\_datetime      | timestamptz (6) | Yes       |         | Time fish were encountered                         |
| fish\_count                    | int4            | No        |         | Number of fish counted                             |
| previously\_counted\_indicator | bool            | No        |         | Were fish counted on a previous survey?            |

### fish\_status\_lut

##### *Status of fish when counted (live, dead)*

| Column name               | Data type    | Nullable? | Key     | Description                      |
|:--------------------------|:-------------|:----------|:--------|:---------------------------------|
| fish\_status\_id          | uuid         | No        | Primary | Globally unique primary key      |
| fish\_status\_description | varchar (25) | No        |         | Description of status categories |

| fish\_status\_id                     | fish\_status\_description |
|:-------------------------------------|:--------------------------|
| 6a200904-8a57-4dd5-8c82-2353f91186ac | Live                      |
| b185dc5d-6b15-4b5b-a54e-3301aec0270f | Dead                      |

### sex\_lut

##### *Sex of fish (male, female, unknown, etc)*

| Column name      | Data type    | Nullable? | Key     | Description                   |
|:-----------------|:-------------|:----------|:--------|:------------------------------|
| sex\_id          | uuid         | No        | Primary | Globally unique primary key   |
| sex\_description | varchar (25) | No        |         | Description of sex categories |

| sex\_id                              | sex\_description |
|:-------------------------------------|:-----------------|
| 1511973c-cbe1-4101-9481-458130041ee7 | Female           |
| ccdde151-4828-4597-8117-4635d8d47a71 | Male             |
| b97eaba9-4205-431b-ab09-a34636557666 | Not applicable   |
| c0f86c86-dc49-406b-805d-c21a6756de91 | Unknown          |

### maturity\_lut

##### *Maturity status of fish (adult, subadult, etc.)*

| Column name                  | Data type     | Nullable? | Key     | Description                              |
|:-----------------------------|:--------------|:----------|:--------|:-----------------------------------------|
| maturity\_id                 | uuid          | No        | Primary | Globally unique primary key              |
| maturity\_short\_description | varchar (75)  | No        |         | Short description of maturity categories |
| maturity\_description        | varchar (200) | No        |         | Full description of maturity categories  |

| maturity\_id                         | maturity\_short\_description | maturity\_description                                                                                           |
|:-------------------------------------|:-----------------------------|:----------------------------------------------------------------------------------------------------------------|
| 00d97caa-ce0d-4283-b238-1b6e6caaba46 | Kelt                         | Salmon that have spawned, typically thin and in poor condition                                                  |
| 68347504-ee22-4632-9856-a4f4366b2bd8 | Adult                        | For salmon, fish that have returned from the ocean after an ocean residence typical for the species.            |
| 0b0d12cf-ed27-48fb-ade2-b408067520e1 | Subadult                     | For salmon, fish of either sex that have returned from the ocean earlier than normal. Typically after one year. |
| 060732b9-230c-48f3-8264-bcb3c078a6e7 | Not applicable               | Does not apply, e.g., no fish encountered                                                                       |

### origin\_lut

##### *Types of fish origin (natural, hatchery, etc.)*

| Column name         | Data type     | Nullable? | Key     | Description                      |
|:--------------------|:--------------|:----------|:--------|:---------------------------------|
| origin\_id          | uuid          | No        | Primary | Globally unique primary key      |
| origin\_description | varchar (100) | No        |         | Description of origin categories |

| origin\_id                           | origin\_description |
|:-------------------------------------|:--------------------|
| 2089de8c-3bd0-48fe-b31b-330a76d840d2 | Unknown             |
| 5251f030-ddb8-4029-8115-c3b998ae8a46 | Hatchery            |
| 2343f15e-94fa-4961-a61f-e449df119f9e | Natural             |
| fcdcbc20-28d7-47f9-9a02-f32996bc2492 | Mixed               |

### cwt\_detection\_status\_lut

##### *Result of coded-wire tag detection efforts*

| Column name                    | Data type    | Nullable? | Key     | Description                     |
|:-------------------------------|:-------------|:----------|:--------|:--------------------------------|
| cwt\_detection\_status\_id     | uuid         | No        | Primary | Globally unique primary key     |
| detection\_status\_description | varchar (75) | No        |         | Description of detection status |

| cwt\_detection\_status\_id           | detection\_status\_description             |
|:-------------------------------------|:-------------------------------------------|
| efe698a8-98dd-45df-ba5b-0d448c88121d | Coded-wire tag undetermined, e.g., no head |
| 6242055f-b2bc-44c1-b0d4-3ce24be44bbe | Coded-wire tag detected                    |
| ba4209af-3839-46a7-bd5d-57bc8516f7af | Coded-wire tag not detected                |
| bd7c5765-2ca3-4ab4-80bc-ce1a61ad8115 | Not applicable                             |
| ea27011e-09cd-46d3-a15d-e95a0cdf05c4 | Did not check for coded-wire tag           |

### adipose\_clip\_status\_lut

##### *Status of adipose fins (clipped, unknown, etc)*

| Column name                        | Data type    | Nullable? | Key     | Description                 |
|:-----------------------------------|:-------------|:----------|:--------|:----------------------------|
| adipose\_clip\_status\_id          | uuid         | No        | Primary | Globally unique primary key |
| adipose\_clip\_status\_code        | varchar (2)  | No        |         | Short code for clip status  |
| adipose\_clip\_status\_description | varchar (75) | No        |         | Description clip status     |

| adipose\_clip\_status\_id            | adipose\_clip\_status\_code | adipose\_clip\_status\_description                           |
|:-------------------------------------|:----------------------------|:-------------------------------------------------------------|
| 33b78489-7ad3-4482-9455-3988e05bfb28 | NC                          | Adipose fin not checked                                      |
| f71eb6d8-cfb8-4873-a07e-44f6a0eb7c93 | UD                          | Adipose fin checked but undetermined, e.g., too deteriorated |
| 66d9a635-a127-4d12-8998-6e86dd93afa6 | UM                          | Adipose fin not clipped                                      |
| c989e267-c2cb-4d0a-842c-725f4257ace1 | UN                          | Undeterminable. Unable to check                              |
| 92d81f24-b5cb-49fd-87d8-b3422ce717fb | AD                          | Adipose fin clipped                                          |
| 1d61246c-003b-49e9-b2a3-cffdddb3905c | na                          | Not applicable                                               |

### fish\_behavior\_type\_lut

##### *Fish behavior type (holding, spawning, etc.)*

| Column name                  | Data type     | Nullable? | Key     | Description                        |
|:-----------------------------|:--------------|:----------|:--------|:-----------------------------------|
| fish\_behavior\_type\_id     | uuid          | No        | Primary | Globally unique primary key        |
| behavior\_short\_description | varchar (50)  | No        |         | Short description of behavior type |
| behavior\_description        | varchar (200) | No        |         | Full description of behavior type  |

| fish\_behavior\_type\_id             | behavior\_short\_description | behavior\_description                                                             |
|:-------------------------------------|:-----------------------------|:----------------------------------------------------------------------------------|
| 99a9ae14-460e-4bcf-b659-047f15591986 | Spawning                     | Fish that are in position for spawning                                            |
| 40ae4bc9-b6db-456a-8b3f-2484183469fe | Holding                      | Live fish that are holding, typically in pools. Includes pre and post spawn fish. |
| 4fbf0dfb-f80c-416f-94d7-2dcbf36a1dfd | Guarding                     | Fish observed defending redd                                                      |
| 226076bd-3d64-4028-82e3-5c6c14c1c188 | Constructing                 | Fish observed in active nest building activity                                    |
| 70454429-724e-4ccf-b8a6-893cafba356a | Not applicable               | Not applicable, i.e. dead fish                                                    |
| 67384410-6891-48cb-bbb8-e95674e5d7a9 | Unknown                      | Behavior was not observed or recorded                                             |

### mortality\_type\_lut

##### *How did fish die? (gear encounter, handling, etc.)*

| Column name                         | Data type     | Nullable? | Key     | Description                         |
|:------------------------------------|:--------------|:----------|:--------|:------------------------------------|
| mortality\_type\_id                 | uuid          | No        | Primary | Globally unique primary key         |
| mortality\_type\_short\_description | varchar (50)  | No        |         | Short description of mortality type |
| mortality\_type\_description        | varchar (200) | No        |         | Full description of mortality type  |

| mortality\_type\_id                  | mortality\_type\_short\_description | mortality\_type\_description                        |
|:-------------------------------------|:------------------------------------|:----------------------------------------------------|
| bacb08ff-1fdf-4d87-b864-2be22b71dd23 | Handling mortality                  | Mortality due to handling fish after capture        |
| 20022177-66e7-41f2-9148-426914e0bdd6 | Weir washup                         | Fish found dead washed up against weir              |
| 149aefd0-0369-4f2c-b85f-4ec6c5e8679c | Not applicable                      | Not applicable, e.g., live fish                     |
| 9647e71f-0727-423b-ab90-50112d823d5f | Gear mortality                      | Mortality due to interaction with fish capture gear |

Fish\_capture\_event
====================

##### *Data for fish encounters during capture type surveys such as mark-recapture*

| Column name                | Data type | Nullable? | Key     | Description                                               |
|:---------------------------|:----------|:----------|:--------|:----------------------------------------------------------|
| fish\_capture\_event\_id   | uuid      | No        | Primary | Globally unique primary key                               |
| fish\_encounter\_event\_id | uuid      | No        | Foreign | Link to fish\_encounter table                             |
| fish\_capture\_status\_id  | uuid      | No        | Foreign | Current capture status (maiden, recapture, etc.)          |
| disposition\_type\_id      | uuid      | No        | Foreign | What happened to fish after encounter?                    |
| disposition\_id            | uuid      | No        | Foreign | Disposition of dead fish (in WDFW hatcheries terminology) |
| disposition\_location\_id  | uuid      | Yes       | Foreign | Link to location table                                    |

### fish\_capture\_status\_lut

##### *Current capture status (maiden, recapture, etc.)*

| Column name                        | Data type     | Nullable? | Key     | Description                   |
|:-----------------------------------|:--------------|:----------|:--------|:------------------------------|
| fish\_capture\_status\_id          | uuid          | No        | Primary | Globally unique primary key   |
| fish\_capture\_status\_code        | varchar (25)  | No        |         | Short code for capture status |
| fish\_capture\_status\_description | varchar (100) | No        |         | Description of capture status |

| fish\_capture\_status\_id            | fish\_capture\_status\_code | fish\_capture\_status\_description           |
|:-------------------------------------|:----------------------------|:---------------------------------------------|
| c979cda2-4b69-408d-823e-02f13bf428ac | Previous year               | Previous year recapture                      |
| 03f32160-6426-4c41-a088-3580a7d1a0c5 | Maiden                      | First capture at facility                    |
| 105ce6c3-1d14-4ca0-8730-bb72527295e5 | Unknown                     | Unknown capture status                       |
| 3d115d9f-1e8b-4f5d-b05d-bcfa21a4d87f | Recapture                   | First recapture at facility                  |
| bdd083a9-499d-4f48-9748-c44d8d6f5c3f | Fallback                    | Fell back to facility after previous capture |

### disposition\_type\_lut

##### *NA*

| Column name                    | Data type     | Nullable? | Key     | Description |
|:-------------------------------|:--------------|:----------|:--------|:------------|
| disposition\_type\_id          | uuid          | No        | Primary |             |
| disposition\_type\_code        | varchar (25)  | No        |         |             |
| disposition\_type\_description | varchar (100) | No        |         |             |

| disposition\_type\_id                | disposition\_type\_code | disposition\_type\_description                         |
|:-------------------------------------|:------------------------|:-------------------------------------------------------|
| ee5f11b1-f910-40ae-a1f3-0e250993bb54 | Spawned                 | Fish spawned                                           |
| f621531e-faa1-42c2-a47b-12529296f731 | Surplus                 | Fish surplused                                         |
| cd4b3735-f8ea-40f8-b933-1f34003de0d0 | Transplanted            | Fish transferred to another non-hachery location       |
| dfcfbe94-9ef3-49c3-ac65-646495eff145 | No data                 | No data regarding disposition recorded                 |
| 028da69b-3682-4ddb-8d20-9c79b601008c | Downstream              | Fish released downstream                               |
| 65abc6b3-50d1-458d-be64-e6a44dabaf85 | Mixed                   | After sampling, fish distributed to multiple locations |
| 06d1d7f9-1767-40b2-949b-e9f6d209a2da | Upstream                | Fish released upstream                                 |
| a9819e0d-0905-48f2-8c43-eea9328f26b8 | Broodstock              | Fish taken to a hatchery                               |
| 7722c088-5c55-4b0a-9764-fb47864c4b31 | Returned                | Fish returned to the trap                              |

### disposition\_lut

##### *Disposition of dead fish (in WDFW hatcheries terminology)*

| Column name              | Data type     | Nullable? | Key     | Description                           |
|:-------------------------|:--------------|:----------|:--------|:--------------------------------------|
| disposition\_id          | uuid          | No        | Primary | Globally unique primary key           |
| disposition\_code        | varchar (25)  | No        |         | Short code for disposition categories |
| fish\_books\_code        | varchar (2)   | Yes       |         | WDFW hatcheries disposition code      |
| disposition\_description | varchar (100) | No        |         | Description of disposition categories |

| disposition\_id                      | disposition\_code | fish\_books\_code | disposition\_description                                |
|:-------------------------------------|:------------------|:------------------|:--------------------------------------------------------|
| dd6d0cab-1cc8-4b07-af93-5cd0be1a7a7f | na                |                   | Not applicable                                          |
| 6dd9aca5-3f12-4032-969b-b885c5e0eb18 | No data           |                   | No data                                                 |
| 3adc91b3-d5ba-4417-9c2f-f7f7f32af40e | TransferTribeCerm | C                 | Transferred to Native American tribe for ceremonial use |
| 5782d945-fada-4dfb-a78b-a2d787ac4036 | Disposed          | D                 | Disposed                                                |
| bd2c3336-4faa-48e9-b426-0b77461dd8e8 | NutrEnhnc         | E                 | Nutrient enhancement                                    |
| 6838268e-774c-4ea1-b3b1-fbc6a614612c | DonateFoodBnk     | F                 | Donated to food bank                                    |
| 2e64e813-68b6-4f8b-80b4-2564a67b7ec0 | DonateOther       | G                 | Donation, other                                         |
| 4425a2b1-3d3b-4f86-8493-d7286e566484 | TransferTribeHarv | H                 | Tranferred to Native American tribe for harvest         |
| f4621284-f592-46dd-b960-7476f8844a83 | NonWDFWTransIn    | I                 | Non-WDFW transfer in                                    |
| 5f093f27-e5a2-4d04-a710-6c37feaa491a | TransferTribe     | N                 | Transferred Tribal                                      |
| 1d3761da-c5b3-44ec-9a89-b827c80339af | NonWDFWTransOut   | O                 | Non-WDFW tranfer out                                    |
| 23b915f8-3803-4c0c-8597-61f4c528054c | Sold              | S                 | Sold                                                    |
| eeed50b0-7dca-406a-b978-cb88f2031758 | TransferWDFW      | T                 | Transferred WDFW                                        |

Fish\_mark
==========

##### *Data for marks and tags applied to fish*

| Column name                | Data type    | Nullable? | Key     | Description                                         |
|:---------------------------|:-------------|:----------|:--------|:----------------------------------------------------|
| fish\_mark\_id             | uuid         | No        | Primary | Globally unique primary key                         |
| fish\_encounter\_event\_id | uuid         | No        | Foreign | Link to fish\_encounter\_event table                |
| mark\_type\_id             | uuid         | No        | Foreign | Type of mark or tag (fin clip, floy tag, etc)       |
| mark\_status\_id           | uuid         | No        | Foreign | Status of mark or tag (applied, observed, etc.)     |
| mark\_orientation\_id      | uuid         | No        | Foreign | Orientation of mark or tag (right, left, etc.)      |
| mark\_placement\_id        | uuid         | No        | Foreign | Placement of mark or tag (adipose fin, snout, etc.) |
| mark\_size\_id             | uuid         | No        | Foreign | Size of mark or tag (large, medium, etc.)           |
| mark\_color\_id            | uuid         | No        | Foreign | Color of mark or tag (blue, green, etc.)            |
| mark\_shape\_id            | uuid         | No        | Foreign | Shape of mark or tag (star, circle, etc.)           |
| tag\_number                | varchar (40) | Yes       |         | Tag number                                          |

### mark\_type\_lut

##### *Type of mark or tag (fin clip, floy tag, etc)*

| Column name              | Data type    | Nullable? | Key     | Description                 |
|:-------------------------|:-------------|:----------|:--------|:----------------------------|
| mark\_type\_id           | uuid         | No        | Primary | Globally unique primary key |
| mark\_type\_category\_id | uuid         | No        | Foreign | Mark or tag?                |
| mark\_type\_code         | varchar (4)  | No        |         | Short code for mark or tag  |
| mark\_type\_description  | varchar (75) | No        |         | Description of mark or tag  |

| mark\_type\_id                       | mark\_type\_code | mark\_type\_description        |
|:-------------------------------------|:-----------------|:-------------------------------|
| d5f00d16-b331-4242-8606-73926f04f06d | Acou             | Acoustic Tag                   |
| a9b0ec64-861b-4e8a-af84-0c58327e36f4 | Carc             | Carcass                        |
| 415c80e4-b3f8-45c5-a70f-bc4057de979d | Clip             | Clip                           |
| 1eec75f2-a61b-4997-9b4f-e032f4d70a2e | CWT              | Coded Wire Tag                 |
| 195780de-4c85-4894-9852-0fa871de3820 | Dart             | Dart                           |
| 2aec69e7-40c4-4304-9340-d9019d415ea9 | Dye              | Dye                            |
| 36c090b2-c164-4ea4-a40e-3c0b5a1b7633 | Floy             | Floy                           |
| 17a65bb8-3612-4cae-8996-c911e0e90f01 | Frze             | Freeze Brand                   |
| 450bae49-1728-40b6-bffa-6fa38b694564 | Jaw              | Jaw                            |
| e868b795-f692-4046-a6e9-3fa77ce10cfc | Oto              | Marked otolith                 |
| 78aa8d53-d856-493b-a3f9-e738e86a4f79 | MJct             | MicroJect                      |
| 89111757-5bb5-469d-9ea0-e9596064b5dc | Oprc             | Opercle Tag                    |
| e4f9403b-cf22-4ccf-a9a7-1fbd64b2b48c | PIT              | Passive Integrated Transponder |
| 6e750d0c-661a-418f-98d5-35926637c975 | Pnch             | Punch                          |
| 607a9bfc-7042-4a72-b282-5cb3cb2b365f | Radi             | Radio                          |
| fdd41f55-c703-4eb2-8bbc-695fce41195f | Sonr             | Sonar                          |
| 78d11f75-622a-44df-8e13-4fbb32daa9c7 | Spag             | Spaghetti                      |
| 3a91010d-842d-4eb1-96b6-4ee735b36949 | VIE              | Visual Implant Elastomer       |

### mark\_type\_category\_lut

##### *Was it a mark or a tag?*

| Column name                | Data type    | Nullable? | Key     | Description                 |
|:---------------------------|:-------------|:----------|:--------|:----------------------------|
| mark\_type\_category\_id   | uuid         | No        | Primary | Globally unique primary key |
| mark\_type\_category\_name | varchar (25) | No        |         | Mark or tag?                |

| mark\_type\_category\_id             | mark\_type\_category\_name |
|:-------------------------------------|:---------------------------|
| eefb6282-c462-4cd0-b996-8c65d53423b3 | Mark                       |
| 5840c8de-dcb7-4da7-bc09-2b47eca4240c | Tag                        |

### mark\_status\_lut

##### *Status of mark or tag (applied, observed, etc.)*

| Column name               | Data type    | Nullable? | Key     | Description                           |
|:--------------------------|:-------------|:----------|:--------|:--------------------------------------|
| mark\_status\_id          | uuid         | No        | Primary | Globally unique primary key           |
| mark\_status\_description | varchar (50) | No        |         | Description of mark status categories |

| mark\_status\_id                     | mark\_status\_description |
|:-------------------------------------|:--------------------------|
| f03eae60-91db-42ba-ba41-623d919262b6 | Applied                   |
| cb1dfe91-a782-4cbf-83c9-299137a5df6e | Missing                   |
| 777753af-df58-4ca3-b4dd-696c52632e36 | Not applicable            |
| 68e174c7-ea47-4084-a567-bd33b241f94e | Observed                  |
| 7118fcda-8804-4285-bc1f-5d5c33048d4e | Unknown                   |

### mark\_orientation\_lut

##### *Orientation of mark or tag (right, left, etc.)*

| Column name                    | Data type    | Nullable? | Key     | Description                                |
|:-------------------------------|:-------------|:----------|:--------|:-------------------------------------------|
| mark\_orientation\_id          | uuid         | No        | Primary | Globally unique primary key                |
| mark\_orientation\_code        | varchar (4)  | No        |         | Short code for mark orientation categories |
| mark\_orientation\_description | varchar (75) | No        |         | Description of mark orientation categories |

| mark\_orientation\_id                | mark\_orientation\_code | mark\_orientation\_description |
|:-------------------------------------|:------------------------|:-------------------------------|
| fcc3fe36-cfa6-481a-8790-879e6616fb09 |                         | Not applicable                 |
| 97045e1b-d659-4d46-97bf-f2c2910ba3bf | Botm                    | Bottom                         |
| bbffd2d0-ce31-4301-839d-e2719101a532 | Left                    | Left                           |
| 09992db3-da10-4598-8a49-d188b84b9711 | Rght                    | Right                          |
| 9fb05dac-7073-4c4d-8bb8-525c8efdd51f | Uppr                    | Upper                          |

### mark\_placement\_lut

##### *Placement of mark or tag (adipose fin, snout, etc.)*

| Column name                  | Data type    | Nullable? | Key     | Description                              |
|:-----------------------------|:-------------|:----------|:--------|:-----------------------------------------|
| mark\_placement\_id          | uuid         | No        | Primary | Globally unique primary key              |
| mark\_placement\_code        | varchar (10) | No        |         | Short code for mark placement categories |
| mark\_placement\_description | varchar (75) | No        |         | Description of mark placement categories |

| mark\_placement\_id                  | mark\_placement\_code | mark\_placement\_description |
|:-------------------------------------|:----------------------|:-----------------------------|
| f0a2cdcf-012a-4468-b223-c7cd0eb2ee58 |                       | Not applicable               |
| d517f1e4-6f8e-4d97-b921-24a277f0b694 | AdipFin               | Adipose fin                  |
| 5213c60c-768c-4c47-8f0e-223f13e9c918 | AnalFin               | Anal fin                     |
| 98f89e8f-f3c6-4be6-86fa-1ad523268a83 | CaudFin               | Caudal fin                   |
| cfd54be2-024d-4329-a42d-68f1d820e7ae | DorsFin               | Dorsal fin                   |
| 6a1546cb-07d4-4514-8a9a-183d9480dcd3 | Maxi                  | Maxillary                    |
| d35aacb1-20b3-41d7-b24e-00d4941b68a8 | Oper                  | Opercle                      |
| 0a0e4adb-9a7d-4fb1-ba3b-5ce3bf0af646 | PectFin               | Pectoral fin                 |
| 3e4234a3-dde5-41be-b39d-dd8a96c15d62 | Snout                 | Snout                        |
| e5c5309a-f750-4391-9192-415004d09900 | VentFin               | Ventral fin                  |

### mark\_size\_lut

##### *Size of mark or tag (large, medium, etc.)*

| Column name             | Data type    | Nullable? | Key     | Description                         |
|:------------------------|:-------------|:----------|:--------|:------------------------------------|
| mark\_size\_id          | uuid         | No        | Primary | Globally unique primary key         |
| mark\_size\_code        | varchar (3)  | No        |         | Short code for mark size categories |
| mark\_size\_description | varchar (25) | No        |         | Description of mark size categories |

| mark\_size\_id                       | mark\_size\_code | mark\_size\_description |
|:-------------------------------------|:-----------------|:------------------------|
| 44459930-c7d0-4b1a-8f60-71a992e574c4 |                  | Not applicable          |
| 2a08ee2c-1edb-41ff-9567-516610f4680e | Lrg              | Large                   |
| a7db8046-0252-4cb0-a96a-9d3dbf5a3fa1 | Med              | Medium                  |
| 78a2433b-1865-4a89-9517-1b474b21b472 | Sml              | Small                   |

### mark\_color\_lut

##### *Color of mark or tag (blue, green, etc.)*

| Column name       | Data type    | Nullable? | Key     | Description                          |
|:------------------|:-------------|:----------|:--------|:-------------------------------------|
| mark\_color\_id   | uuid         | No        | Primary | Globally unique primary key          |
| mark\_color\_code | varchar (6)  | No        |         | Short code for mark color categories |
| mark\_color\_name | varchar (25) | No        |         | Name of mark color categories        |

| mark\_color\_id                      | mark\_color\_code | mark\_color\_name  |
|:-------------------------------------|:------------------|:-------------------|
| 66076cfd-f4a2-4ec8-861a-346e41c626b5 |                   | Not applicable     |
| 926a92a3-deae-40ab-9f84-98311115d5f0 | Blu               | Blue               |
| 76a5de57-8563-46bd-99c1-a2d24ed22cec | Brn               | Brown              |
| cee0a3bc-780a-4bf8-a0f9-387f2732ddb9 | Chrtse            | Chartreuse         |
| 75e782fc-916d-46b8-8616-42736d269fa9 | DrkBlu            | Dark blue          |
| 1e26534d-b76e-499d-9ddc-de301265b641 | FloPnk            | Fluorescent Pink   |
| e448c9ac-9aaf-4f53-8dbd-b8c083dd51e5 | FloYel            | Fluorescent Yellow |
| c7ea5694-0816-4cbd-bee8-1b3048d50bb8 | Grn               | Green              |
| 3b6e7582-393f-457a-9817-afc0ba6a93a1 | LgtBlu            | Light blue         |
| 0090a83f-6dc9-4fdd-b948-7d35b1c2a074 | Org               | Orange             |
| b10b637b-b043-4df0-9c92-76f279a1fc4b | OrgBlu            | Orange - Blue      |
| 32a13427-ad33-43ee-b6ef-9bedd9400424 | Pnk               | Pink               |
| a4d93c9c-3408-4b95-b244-9c009d89a022 | PnkBlu            | Pink - Blue        |
| 141e2db5-67d4-4265-9db4-7402ba042379 | Prp               | Purple             |
| b1e71bca-b13d-4fba-bc2e-82aa5181fad4 | Red               | Red                |
| a7d0ad65-14d5-4687-af70-0749d2ffeebf | Vio               | Violet             |
| fe75ea10-8c7f-457a-ac2e-efac5948778b | Wht               | White              |
| 930ec31e-6393-44dd-824b-6a19c9be1c78 | Yel               | Yellow             |
| 677974c1-2127-475d-885a-037ec75c4e75 | YelBlu            | Yellow - Blue      |

### mark\_shape\_lut

##### *Shape of mark or tag (star, circle, etc.)*

| Column name              | Data type    | Nullable? | Key     | Description                          |
|:-------------------------|:-------------|:----------|:--------|:-------------------------------------|
| mark\_shape\_id          | uuid         | No        | Primary | Globally unique primary key          |
| mark\_shape\_code        | varchar (4)  | No        |         | Short code for mark shape categories |
| mark\_shape\_description | varchar (25) | No        |         | Description of mark shape categories |

| mark\_shape\_id                      | mark\_shape\_code | mark\_shape\_description |
|:-------------------------------------|:------------------|:-------------------------|
| 469c9ba7-3288-404e-9c75-d9b8d9a7600b |                   | Not applicable           |
| 89c17522-c0f5-465e-92f0-540860a07d89 | Circ              | Circle                   |
| 0925b8bc-413c-469d-9bec-d3a8ff409e7b | Crsc              | Crescent                 |
| 165c3499-e8fd-4e53-8c42-8d55dfa71574 | Diam              | Diamond                  |
| 123fd80a-bbc7-47ee-a143-b1513c15d1ff | Rect              | Rectangle                |
| 951a40d3-05dc-44de-926c-e0841e2a87e4 | Sqar              | Square                   |
| 34a28ed3-1a06-488d-94b2-d4844fa273f3 | Star              | Star                     |
| 32a3d264-6670-4661-bde9-f5c33faaee40 | Trig              | Triangle                 |

Individual\_fish
================

##### *Data for individual fish*

| Column name                        | Data type      | Nullable? | Key     | Description                                     |
|:-----------------------------------|:---------------|:----------|:--------|:------------------------------------------------|
| individual\_fish\_id               | uuid           | No        | Primary | Globally unique primary key                     |
| fish\_encounter\_event\_id         | uuid           | No        | Foreign | Link to fish\_encounter\_event table            |
| carcass\_condition\_type\_id       | uuid           | No        | Foreign | Status of carcass in terms of deterioration     |
| live\_fish\_condition\_type\_id    | uuid           | No        | Foreign | Status of live fish in terms of deterioration   |
| fish\_trauma\_type\_id             | uuid           | No        | Foreign | Categories of wounds or scars visible on fish   |
| gill\_condition\_type\_id          | uuid           | No        | Foreign | Condition of gills in terms of color            |
| spawn\_condition\_type\_id         | uuid           | No        | Foreign | Spawning condition of fish                      |
| cwt\_result\_type\_id              | uuid           | No        | Foreign | CWT analysis result (decoded tag, no tag, etc.) |
| eggs\_retained\_estimated\_percent | int4           | Yes       |         | Estimated percent of eggs retained              |
| eggs\_retained\_grams              | numeric (4, 1) | Yes       |         | Weight of retained eggs                         |
| eggs\_retained\_estimated\_number  | int4           | Yes       |         | Estimated number of eggs retained               |
| fish\_sample\_number               | varchar (40)   | Yes       |         | Carcass sample number                           |
| scale\_sample\_card\_number        | varchar (40)   | Yes       |         | Scale card number                               |
| scale\_sample\_position\_number    | varchar (40)   | Yes       |         | Position number on scale card                   |
| cwt\_snout\_sample\_number         | varchar (40)   | Yes       |         | Coded-wire tag snout sample number              |
| cwt\_tag\_code                     | varchar (10)   | Yes       |         |                                                 |
| genetic\_sample\_number            | varchar (40)   | Yes       |         | Genetic sample number                           |
| otolith\_sample\_number            | varchar (40)   | Yes       |         | Otolith sample number                           |
| total\_age                         | int4           | Yes       |         | Total age of fish                               |
| fresh\_water\_age                  | int4           | Yes       |         | Total fresh water age of fish                   |
| age\_code                          | varchar (15)   | Yes       |         | Age code determined by age laboratory           |
| comment\_text                      | varchar (1000) | Yes       |         | Additional comments on individual fish          |

### carcass\_condition\_type\_lut

##### *Status of carcass in terms of deterioration*

| Column name                            | Data type     | Nullable? | Key     | Description                            |
|:---------------------------------------|:--------------|:----------|:--------|:---------------------------------------|
| carcass\_condition\_type\_id           | uuid          | No        | Primary | Globally unique primary key            |
| carcass\_condition\_short\_description | varchar (25)  | No        |         | Short description of carcass condition |
| carcass\_condition\_description        | varchar (150) | No        |         | Full description of carcass condition  |

| carcass\_condition\_type\_id         | carcass\_condition\_short\_description | carcass\_condition\_description                                  |
|:-------------------------------------|:---------------------------------------|:-----------------------------------------------------------------|
| bb5ca007-06ff-4e26-b5ea-46638a18f8cb | No data                                | No data regarding condition was recorded                         |
| 2fa713f9-ee6d-4928-8f1e-8292aff0a285 | Excellent                              | Fresh carcass, both eyes clear, and gill color bright red.       |
| 540ab7d1-576c-42fa-8359-969777099dbd | Good                                   | Slightly decayed carcass, eyes cloudy, firm flesh.               |
| 0cd8f278-1c3e-4ad4-b7c7-9afebc8e2358 | Not applicable                         | Not applicable, e.g. live fish                                   |
| e160468b-8e66-46e6-9a4f-a4a5356bf0a5 | Skeleton                               | Carcass has lost significant flesh or is primarily exposed bones |
| 353f3f2c-4a3d-4fc3-a4db-bde30a6e2252 | Fair                                   | Carcass decayed, eyes cloudy, and firm flesh                     |
| 91df61da-6dbe-466a-b268-d175cbdc3fe7 | Poor                                   | Carcass extensively decayed, eyes cloudy and soft flesh          |

### live\_fish\_condition\_type\_lut

##### *Status of live fish in terms of deterioration*

| Column name                         | Data type     | Nullable? | Key     | Description                              |
|:------------------------------------|:--------------|:----------|:--------|:-----------------------------------------|
| live\_fish\_condition\_type\_id     | uuid          | No        | Primary | Globally unique primary key              |
| live\_condition\_short\_description | varchar (25)  | No        |         | Short description of live fish condition |
| live\_condition\_description        | varchar (150) | No        |         | Full description of live fish condition  |

| live\_fish\_condition\_type\_id      | live\_condition\_short\_description | live\_condition\_description                                                        |
|:-------------------------------------|:------------------------------------|:------------------------------------------------------------------------------------|
| f227bca2-3b5c-4708-b6ad-17b6e89d2a2e | No data                             | No data regarding condition was recorded                                            |
| efc06df2-6e67-425a-a317-7439e2fbf784 | Poor                                | Fish in a zombie state. Many scars, fungus, and very close to death.                |
| d770744b-0d06-436c-88fd-874bb29de42e | Good                                | Fish primarily silver but some fresh water color changes evident.                   |
| d2e9dd06-a7c5-4eb5-ab7a-9919c70b6fb3 | Excellent                           | Fish appears as just in from salt water. May have sea lice.                         |
| 0cf64b37-9662-44ab-856d-b4ea3de75cd1 | Fair                                | Fish has fresh water coloration, fungus, and obvious fin wear, but is still active. |
| 66ac79eb-dba6-4764-834d-e2827d355e8b | Not applicable                      | Not applicable, e.g. dead fish                                                      |

### fish\_trauma\_type\_lut

##### *Categories of wounds or scars visible on fish*

| Column name                      | Data type     | Nullable? | Key     | Description                      |
|:---------------------------------|:--------------|:----------|:--------|:---------------------------------|
| fish\_trauma\_type\_id           | uuid          | No        | Primary | Globally unique primary key      |
| trauma\_type\_short\_description | varchar (25)  | No        |         | Short description of trauma type |
| trauma\_type\_description        | varchar (150) | No        |         | Full description of trauma type  |

| fish\_trauma\_type\_id               | trauma\_type\_short\_description | trauma\_type\_description                                                                   |
|:-------------------------------------|:---------------------------------|:--------------------------------------------------------------------------------------------|
| 9aaf1060-35eb-41c7-b68a-e7ec5d1e69b3 | Bird marks                       | Fish with marks or scars inflicted by birds                                                 |
| 38e24614-7e23-4b41-a290-c19af14a36ca | Breached egg cavity              | Egg cavity had been breached prior to sampling                                              |
| be7ab1b7-7177-4116-93c4-65441b45ac18 | Gill net marks                   | Fresh wound observed on fish from a gill net.                                               |
| eeda4e1f-fbba-4dba-95b1-9564a05cd173 | Hook scar                        | Healed scar observed on fish from sport or commercial hook.                                 |
| 92351ea1-32a7-4d0b-80f7-58107a189731 | Net marks                        | Fresh wound observed on fish from a net of undetermined type.                               |
| 92aecee2-4a55-4b0f-ace6-8648d5da560a | No data                          | No data provided                                                                            |
| 57d905c7-e87c-4bf1-bee2-959c90e9c377 | No trauma                        | No scar or wound observed.                                                                  |
| 9fd67e74-1ef1-4798-8446-e9a7e9a82af6 | Seal bite                        | Fresh or healed scars from the teeth of sea lions or seals. Referred to as 'golden arches'. |
| 85897065-183a-4f10-8b46-259cf9eb313f | Seal scrape                      | Fresh or healed scar observed on fish from seal or sea lion flipper nails.                  |
| 4ec2b8e3-7565-42b2-a2c2-588975c7781e | Slit belly                       | Female fish carcass with abdominal cavity cut open for removal of egg skein.                |
| 77b29d33-a2a3-456f-a498-ab016830a8bc | Snag scar                        | Healed scar observed on fish from sport or commercial hook probably from snagging.          |
| db5ccee5-121f-4a52-82be-91b11f6f92e6 | Snag wound                       | Fresh wound observed on fish from sport or commercial hook probably from snagging.          |
| 3e779ba0-403b-4560-ac69-66357aac48f7 | Snout eaten                      | Snout or kype of fish removed by predator.                                                  |

### gill\_condition\_type\_lut

##### *Condition of gills in terms of color*

| Column name                        | Data type    | Nullable? | Key     | Description                   |
|:-----------------------------------|:-------------|:----------|:--------|:------------------------------|
| gill\_condition\_type\_id          | uuid         | No        | Primary | Globally unique primary key   |
| gill\_condition\_type\_description | varchar (50) | No        |         | Description of gill condition |

| gill\_condition\_type\_id            | gill\_condition\_type\_description |
|:-------------------------------------|:-----------------------------------|
| 55f96362-46d6-4b6b-a45a-1aeb68b7f01e | Dull red, 3/4 of live color        |
| 3460d1ff-4c94-47ad-a2ac-4dfdfa844e23 | Pink, 2/4 of live color            |
| 31b6695c-c291-41b9-957e-71ed5714c0fd | Gray or white, 0/4 or live color   |
| 53e88da1-db78-4063-b402-be9c44572b7e | Dull pink, 1/4 or live color       |
| 33aea984-7639-491b-9663-c641ee78a90a | No data                            |
| 14173f9e-8694-468a-846a-e6c5e5f32cbe | Dark red, 4/4 or live color        |

### spawn\_condition\_type\_lut

##### *Spawning condition of fish (pre, post, etc.)*

| Column name                          | Data type     | Nullable? | Key     | Description                          |
|:-------------------------------------|:--------------|:----------|:--------|:-------------------------------------|
| spawn\_condition\_type\_id           | uuid          | No        | Primary | Globally unique primary key          |
| spawn\_condition\_short\_description | varchar (50)  | No        |         | Short description of spawn condition |
| spawn\_condition\_description        | varchar (200) | No        |         | Full description of spawn condition  |

| spawn\_condition\_type\_id           | spawn\_condition\_short\_description | spawn\_condition\_description                                                                                          |
|:-------------------------------------|:-------------------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| a89b761e-7fb1-4dcb-bf52-2e804790c67e | Spawn condition - partial            | Fish in spawning condition, with some eggs missing                                                                     |
| d8129c5a-8005-4ef6-90cb-5950325ac0e1 | Spawn conditon - spent               | Fish in spawning condition, with all eggs missing                                                                      |
| 44eca456-ed1f-4ab4-8feb-7d2bf2e326a5 | Post-spawn condition - spent         | Fish in post-spawn condition, with all eggs missing                                                                    |
| d27c8d01-0b96-42f5-9d01-910b7fba5123 | Pre-spawn condition - green          | Fish full of eggs but not ready to spawn. Ovipositor is not obtruding, or will not obtrude when squeezed.              |
| e89d8979-ce87-4c0e-8ed7-9e07b831c963 | No data                              | No data recorded                                                                                                       |
| c5c71a8f-d19e-41dd-829e-bfc54a91688a | Pre-spawn condition - ripe           | Fish full of eggs and ready to spawn. Belly is loose and soft, ovipositor is obtruding, or will obtrude whan squeezed. |
| 8094ab12-322b-488c-9e8d-f849842ff855 | Post-spawn condition - partial       | Fish in post-spawn condition, with some eggs missing                                                                   |

### cwt\_result\_type\_lut

##### *Result of CWT analysis (decoded tag, no tag, etc.)*

| Column name                           | Data type     | Nullable? | Key     | Description                           |
|:--------------------------------------|:--------------|:----------|:--------|:--------------------------------------|
| cwt\_result\_type\_id                 | uuid          | No        | Primary | Globally unique primary key           |
| cwt\_result\_type\_code               | varchar (2)   | No        |         | Matches CWT database result type code |
| cwt\_result\_type\_short\_description | varchar (25)  | No        |         | Short description of cwt result type  |
| cwt\_result\_type\_description        | varchar (100) | No        |         | Full description of cwt result type   |

| cwt\_result\_type\_id                | cwt\_result\_type\_code | cwt\_result\_type\_short\_description | cwt\_result\_type\_description               |
|:-------------------------------------|:------------------------|:--------------------------------------|:---------------------------------------------|
| 3b5e6cf9-8de8-4073-b803-fec2ad490fb4 | 1                       | Decoded tag                           | Tag was decoded with no discrepancies        |
| 0460d357-a224-4bf7-a071-e7d384337a0b | 2                       | No tag                                | No tag wire was found in the snout           |
| 7f6626f2-d996-432d-aba3-9f78b0e6ed3a | 3                       | Lost tag                              | Tag was lost in lab process before reading   |
| 150eb9a0-e054-4c85-856c-1c416aaca30c | 4                       | Unreadable tag                        | Complete code on the tag wire is unreadable  |
| ea49122f-a051-4be7-a6e5-8639066c0404 | 7                       | Tag discrepancy                       | Recovery data incompatible with release data |
| db6bc7e5-4acd-41dc-b4bc-f759472b5221 | 8                       | No snout                              | Snout identified as CWT but not processed    |
| 48531ad3-ca73-4c05-a5ff-c3d6648ab677 | 9                       | Blank wire tag                        | Tag is blank wire or agency-only wire        |
| 3b5e368f-11ce-4bb3-8c8f-70c08dde2f7e | 10                      | Not applicable                        | Not applicable                               |

Fish\_length\_measurement
=========================

##### *Individual fish length measurements (can be multiple per fish)*

| Column name                         | Data type      | Nullable? | Key     | Description                                |
|:------------------------------------|:---------------|:----------|:--------|:-------------------------------------------|
| fish\_length\_measurement\_id       | uuid           | No        | Primary | Globally unique primary key                |
| individual\_fish\_id                | uuid           | No        | Foreign | Link to individual\_fish table             |
| fish\_length\_measurement\_type\_id | uuid           | No        | Foreign | Type of length measurement (FL, POH, etc.) |
| length\_measurement\_centimeter     | numeric (6, 2) | No        |         | Length in centimeter                       |

### fish\_length\_measurement\_type\_lut

##### *Types of length measurements*

| Column name                         | Data type    | Nullable? | Key     | Description                            |
|:------------------------------------|:-------------|:----------|:--------|:---------------------------------------|
| fish\_length\_measurement\_type\_id | uuid         | No        | Primary | Globally unique primary key            |
| length\_type\_code                  | varchar (5)  | No        |         | Short code for length measurement type |
| length\_type\_description           | varchar (75) | No        |         | Description of length measurement type |

| fish\_length\_measurement\_type\_id  | length\_type\_code | length\_type\_description              |
|:-------------------------------------|:-------------------|:---------------------------------------|
| 740dbd1a-93fe-4355-8e78-722afba53b9f | FL                 | Fork length                            |
| acc10539-5c97-464e-8f57-f4b92e1e7b2d | MH                 | Mid-eye to hypural length              |
| 6009bdb8-a704-4a60-a487-5f6fc3ad2edd | MP                 | Mid-eye to posterior most scale length |
| f68b6789-96de-4ac7-ae93-6eb7a4eef36b | NS                 | Not specified                          |
| 5e355040-adf1-4dce-a965-b79db4e5ec03 | POH                | Post-orbital to hypural plate length   |
| 63e183a7-0f29-4b59-97f5-9a88038dc71e | TL                 | Total length                           |

Redd\_encounter\_event
======================

##### *Data for redd encounters, includes data for one or multiple redds*

| Column name                | Data type       | Nullable? | Key     | Description                                |
|:---------------------------|:----------------|:----------|:--------|:-------------------------------------------|
| redd\_encounter\_event\_id | uuid            | No        | Primary | Globally unique primary key                |
| survey\_event\_id          | uuid            | No        | Foreign | Link to survey\_event table                |
| redd\_location\_id         | uuid            | Yes       | Foreign | Link to location table                     |
| redd\_status\_id           | uuid            | No        | Foreign | Status of redds (new, still visible, etc.) |
| redd\_encounter\_datetime  | timestamptz (6) | Yes       |         | Time redds were encountered                |
| redd\_count                | int4            | No        |         | Number of redds encountered                |
| comment\_text              | varchar (1000)  | Yes       |         | Additional comment on redd encounter       |

### redd\_status\_lut

##### *Status of redds (new, old but still visible, etc.)*

| Column name                      | Data type     | Nullable? | Key     | Description                                 |
|:---------------------------------|:--------------|:----------|:--------|:--------------------------------------------|
| redd\_status\_id                 | uuid          | No        | Primary | Globally unique primary key                 |
| redd\_status\_code               | varchar (2)   | No        |         | Short code for redd status categories       |
| redd\_status\_short\_description | varchar (50)  | No        |         | Short description of redd status categories |
| redd\_status\_description        | varchar (250) | No        |         | Full description of redd status categories  |

| redd\_status\_id                     | redd\_status\_code | redd\_status\_short\_description | redd\_status\_description                                                                                                                                          |
|:-------------------------------------|:-------------------|:---------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1fd61991-79f9-4684-9fd3-8d156227e312 | CR                 | Combined visible redds           | Combined count of visible new and old redds. Primarily used when it is not practical to separate new from previously counted redds, such as during aerial surveys. |
| 281dc7bd-f6b6-49d1-b74e-2b2f95a567d3 | NO                 | Previous redd, status unknown    | Redd not observed. Possibly due to a missing flag, a data collection error, or the redd having been obscured.                                                      |
| 45fda25c-9120-406c-b159-2aead75623c0 | NR                 | New redd                         | Bright, fresh, new redd that is encountered for the first time during a survey.                                                                                    |
| 9247b24e-accb-4a43-9420-53964fea645e | NV                 | Previous redd, not visible       | Previously observed redd that is no longer visible; if it were observed for the first time it would not be classified as a redd.                                   |
| a9a75d00-7c64-429c-abf0-37ed6a3f19f1 | SV                 | Previous redd, still visible     | Previously observed redd that is still visible; if it were observed for the first time it would still be classified as a redd.                                     |
| 71156bae-2a9d-4974-8ec4-6ca374cc92d0 | VM                 | Previous redd, still measurable  | Previously observed redd that is still visible and measurable.                                                                                                     |
| d485f11f-3a4f-4c97-a466-571fc01d9b15 | VU                 | Previous redd, not measurable    | Previously observed redd that is still visible but no longer measurable.                                                                                           |

Redd\_confidence
================

##### *Assessment of redd observation (probably redd, test dig, etc.)*

| Column name                          | Data type      | Nullable? | Key     | Description                                     |
|:-------------------------------------|:---------------|:----------|:--------|:------------------------------------------------|
| redd\_confidence\_id                 | uuid           | No        | Primary | Globally unique primary key                     |
| redd\_encounter\_event\_id           | uuid           | No        | Foreign | Link to redd\_encounter\_event table            |
| redd\_confidence\_type\_id           | uuid           | No        | Foreign | Categories of redd assessment and confidence    |
| redd\_confidence\_review\_status\_id | uuid           | No        | Foreign | Status of redd assessment (prelim, final, etc.) |
| comment\_text                        | varchar (1000) | Yes       |         | Additional comments on redd confidence          |

### redd\_confidence\_type\_lut

##### *Assessment categories for redd observation (probably redd, test dig, etc.)*

| Column name                          | Data type     | Nullable? | Key     | Description                                |
|:-------------------------------------|:--------------|:----------|:--------|:-------------------------------------------|
| redd\_confidence\_type\_id           | uuid          | No        | Primary | Globally unique primary key                |
| confidence\_type\_short\_description | varchar (50)  | No        |         | Short description of assessment categories |
| confidence\_type\_description        | varchar (200) | No        |         | Full description of assessment categories  |

| redd\_confidence\_type\_id           | confidence\_type\_short\_description | confidence\_type\_description                                                                      |
|:-------------------------------------|:-------------------------------------|:---------------------------------------------------------------------------------------------------|
| 7b08cf86-b5a7-4335-878e-b6c8e6ecd883 | Artificial redd                      | A known artificial redd                                                                            |
| f67a15f8-408a-4340-ac8c-67a9676ae25f | Definite redd                        | Based on observer judgement, determined to be definite redd                                        |
| 7e937539-2ddb-442c-99be-87baa3be1175 | Hydraulic feature                    | Based on observer judgement, determined to be a redd-like structure created strictly by hydraulics |
| ce94a9e2-f724-49c3-ba72-34ebdc2b5ecc | No data                              | Observer did not record any determination of redd confidence                                       |
| cbd29c8f-cfca-410d-a269-1100a7565dd5 | Probably redd                        | Based on observer judgement, determined to be likely redd                                          |
| 6bedb16c-dc43-4fc3-a9a6-c54da2b6e9bd | Test dig                             | Based on observer judgement, determined to be test dig. Definitely not a redd.                     |

### redd\_confidence\_review\_status\_lut

##### *Status of redd assessment (preliminary, final, etc.)*

| Column name                          | Data type    | Nullable? | Key     | Description                               |
|:-------------------------------------|:-------------|:----------|:--------|:------------------------------------------|
| redd\_confidence\_review\_status\_id | uuid         | No        | Primary | Globally unique primary key               |
| review\_status\_description          | varchar (50) | No        |         | Current status of redd observation review |

| redd\_confidence\_review\_status\_id | review\_status\_description |
|:-------------------------------------|:----------------------------|
| 36d92467-b94c-463d-a91f-2c439e7568bc | Final                       |
| bb0f5f07-4257-44ee-87e4-9d2f6329fbfa | Unknown                     |
| 8f2a24b5-da50-4089-80e4-da6e4d4d53b2 | Preliminary                 |

Redd\_substrate
===============

##### *Types of substrate associated with redds*

| Column name                | Data type | Nullable? | Key     | Description                                        |
|:---------------------------|:----------|:----------|:--------|:---------------------------------------------------|
| redd\_substrate\_id        | uuid      | No        | Primary | Globally unique primary key                        |
| redd\_encounter\_event\_id | uuid      | No        | Foreign | Link to redd\_encounter\_event table               |
| substrate\_level\_id       | uuid      | No        | Foreign | Ranking of substrate types (most common, etc)      |
| substrate\_type\_id        | uuid      | No        | Foreign | Substrate types (cobble, gravel, etc.)             |
| substrate\_percent         | int4      | No        |         | Relative proportion of substrate type at redd site |

### substrate\_level\_lut

##### *Ranking of substrate types present at redd site (primary, secondary, etc)*

| Column name                          | Data type     | Nullable? | Key     | Description                               |
|:-------------------------------------|:--------------|:----------|:--------|:------------------------------------------|
| substrate\_level\_id                 | uuid          | No        | Primary | Globally unique primary key               |
| substrate\_level\_short\_description | varchar (25)  | No        |         | Short description of substrate categories |
| substrate\_level\_description        | varchar (100) | No        |         | Full description of substrate categories  |

| substrate\_level\_id                 | substrate\_level\_short\_description | substrate\_level\_description     |
|:-------------------------------------|:-------------------------------------|:----------------------------------|
| 8ba909e4-c9a4-43fa-975f-2a60ea4de4eb | Primary                              | Most common substrate type        |
| 90189b2c-9b5a-4bd5-879b-96bb836482f8 | Secondary                            | Second most common substrate type |
| ea4371e4-e42b-4789-a48d-a13c6d3679bd | Quaternary                           | Fourth most common substrate type |
| 81b4e454-2a2e-4651-b6a5-db1395e77f3e | Tertiary                             | Third most common substrate type  |

### substrate\_type\_lut

##### *Types of substrate present at redd site (cobble, gravel, etc.)*

| Column name                  | Data type    | Nullable? | Key     | Description                    |
|:-----------------------------|:-------------|:----------|:--------|:-------------------------------|
| substrate\_type\_id          | uuid         | No        | Primary | Globally unique primary key    |
| substrate\_type\_description | varchar (25) | No        |         | Description of substrate types |

| substrate\_type\_id                  | substrate\_type\_description |
|:-------------------------------------|:-----------------------------|
| 95e41faa-9b23-4d7b-9626-2ac1b23f51fe | Large cobble                 |
| 937aa76c-a7a9-45a7-8bb1-4e4ffd44ce79 | Sand                         |
| 8911b69d-49c2-495f-abaa-8e6c3aef2c37 | Large gravel                 |
| 0e1864ab-0ef9-4d8f-b5d8-97bc81eb76d4 | Gravel                       |
| 32620970-9e9a-44d7-a10b-9b1fa29131ca | Mud                          |
| 6c502d35-a953-4c77-ab9a-9e8b8cc47691 | Boulder                      |
| 59d8d65b-cd84-4469-b0d6-d1339b7964ce | Small gravel                 |
| 0a516f27-7b3e-4662-8b6a-e699ceddbf27 | Cobble                       |
| a258f965-4da5-4477-8cc5-fe779b17e9cf | Small cobble                 |

Individual\_redd
================

##### *Data for individual redd*

| Column name                       | Data type      | Nullable? | Key     | Description                                |
|:----------------------------------|:---------------|:----------|:--------|:-------------------------------------------|
| individual\_redd\_id              | uuid           | No        | Primary | Globally unique primary key                |
| redd\_encounter\_event\_id        | uuid           | No        | Foreign | Link to redd\_encounter\_event table       |
| redd\_shape\_id                   | uuid           | No        | Foreign | Redd shape (oval, teardrop, etc.)          |
| percent\_redd\_visible            | int4           | Yes       |         | Percent of redd that is still visible      |
| redd\_length\_measure\_meter      | numeric (4, 2) | Yes       |         | Length of redd in meters                   |
| redd\_width\_measure\_meter       | numeric (4, 2) | Yes       |         | Width of redd in meters                    |
| redd\_depth\_measure\_meter       | numeric (3, 2) | Yes       |         | Depth of redd in meters                    |
| tailspill\_height\_measure\_meter | numeric (3, 2) | Yes       |         | Height of tailspill in meters              |
| percent\_redd\_superimposed       | int4           | Yes       |         | Percent of redd that has been superimposed |
| comment\_text                     | varchar (1000) | Yes       |         | Additional comments for individual redd    |

### redd\_shape\_lut

##### *Redd shape (oval, teardrop, etc.)*

| Column name              | Data type     | Nullable? | Key     | Description                     |
|:-------------------------|:--------------|:----------|:--------|:--------------------------------|
| redd\_shape\_id          | uuid          | No        | Primary | Globally unique primary key     |
| redd\_shape\_description | varchar (100) | No        |         | Description of redd shape types |

| redd\_shape\_id                      | redd\_shape\_description |
|:-------------------------------------|:-------------------------|
| 7ed73965-d786-4899-8c71-c66bd794dd77 | Teardrop                 |
| 04158817-5107-4625-8c4e-e28ecb751a0d | Irregular                |
| 9fc00c46-e7c7-4257-a2b7-e6e171772136 | Oval                     |
