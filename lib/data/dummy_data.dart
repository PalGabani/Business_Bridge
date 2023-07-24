import 'package:business_bridge/models/business_category.dart';
import 'package:business_bridge/models/case_study.dart';
import 'package:flutter/material.dart';

const availableCategories = [
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b2',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b3',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
  Category(
    id: 'b1',
    name: 'Italian',
    color: Colors.lightBlueAccent,
  ),
];

const dummyMeals = [
  case_Study(
    id: 'c1',
    title: 'TELBOT TRUCKS LTD.',
    imageUrl: 'assets/images/case_study/case_transport.jpg',
    ClientGoal: [
      "Our client is Talbot Trucks. Talbot Trucks has approached McKinsey for help in assessing the feasibility of manufacturing electric trucks to reduce its fleet’s carbon footprint."
    ],
    Situation: [
      'Talbot Trucks is a Europe-based private truck OEM. It produces and sells trucks all over the world. Talbot Trucks is considered a leader in quality manufacturing. Its primary customer base includes large trucking companies that own thousands of trucks and owner-operators, which are smaller customers that own fewer trucks.\n\nTrucks today are mainly powered by diesel engines and require carbon-based petroleum fuel. Talbot Trucks is interested in exploring ways to reduce the carbon footprint of its vehicles and has specifically asked about electric trucks, or “eTrucks.”\n\nETrucks and diesel trucks differ in the design—e-motor and batteries versus combustion engines—and also in the way they are fueled, meaning comparably slow charging versus quick refilling with diesel fuel at gas stations. The introduction of this new technology is disruptive for the manufacturers as well as customers both large and small.'
    ],
    Study: [
      'The CEO of Talbot Trucks has approached McKinsey to help determine the attractiveness of an investment in eTruck manufacturing for its European market. '
    ],
  ),

  case_Study(
    id: 'c2',
    title: 'BEAUTIFY LTD.',
    imageUrl: 'assets/images/case_study/case_beautify.jpg',
    ClientGoal: [
      'Our client is Beautify. Beautify has approached McKinsey for help with exploring new ways to approach its customers.'
    ],
    Situation: [
      'Beautify is a global prestige cosmetics company that sells its products mainly inside high-end department stores such as Harrods and Shanghai No. 1. It also has a presence online with specialty retailers like Sephora. Beautify produces a number of makeup, fragrance, and skin care products sold under several different brands. \n\nIn department stores, beauty consultants play a critical role with consumers: \n - approaching “passive” customers\n - demonstrating their knowledge of the products \n - actively selling the products \n - maintaining a loyal customer base of repeat buyers \n\nThese consultants are hired directly by Beautify or through specialist, third-party agencies that find new recruits for a fee. Beautify is then responsible for selecting, training, and paying the consultants. Within Beautify, beauty consultants are managed independently by each brand in each country. For example, this may mean a consultant might be part of the Chanel team in a store. However, consumers are shifting more to online shopping, and too many beauty consultants are left working in empty department stores'
    ],
    Study: ['Beautify’s president and COO engaged McKinsey to help evaluate if training the majority of beauty consultants to use virtual channels to connect with customers could be profitable for the company.'],
  ),

  case_Study(
    id: 'c3',
    title: 'LORAVIA GOVT. PROJECT',
    imageUrl: 'assets/images/case_study/case_goverment.jpg',
    ClientGoal: ['Loravia is a fictional country located in Eastern Europe with a population of 20 million. The government of Loravia wants to make major improvements in both the quantity and quality of education for its children. Because McKinsey has great deal of global knowledge and expertise in the education sector, the Loravian department of education has asked McKinsey to advise on how it can achieve this transformation of its school system.'],
    Situation: ['Loravia’s free market economy is still developing, having emerged from many decades under communism. Recently, the government of Loravia put a new economic plan in place with aspirations to transform its economy and turbocharge its development so it’s well positioned to compete with its European neighbors. The government of Loravia realizes that the education of its children is a critical factor in meeting crucial economic development goals. It intends to transform the school system over the next ten years to enable it to support its economic aspirations. \nSchooling in Loravia is completely public and is provided by a network of government-run schools that admit children from ages five through 18. \n\nThe first stage of this effort will involve diagnosing the current state of education in schools in Loravia to determine how best to meet the government’s future aspirations.'],
    Study: ['McKinsey has been asked to support the Loravian department of education in diagnosing the state of its current school system, and in identifying the most important areas for improvement.'],
  ),

  case_Study(
    id: 'c4',
    title: 'GLOBAL PHARMA LTD.',
    imageUrl: 'assets/images/case_study/case_pharm.jpg',
    ClientGoal: ['Our client is GlobaPharm, a major pharmaceutical company (pharmaco) with \$10 billion a year in revenue. Its corporate headquarters and primary research and development (R&D) centers are in Germany, with regional sales offices worldwide.'],
    Situation: ['GlobaPharm has a long, successful tradition in researching, developing, and selling “small molecule” drugs. This class of drugs represents the vast majority of drugs today, including aspirin and most blood-pressure or cholesterol medications. GlobaPharm is interested in entering a new, rapidly growing segment of drugs called “biologicals.” These are often proteins or other large, complex molecules that can treat conditions not addressable by traditional drugs. \n\nR&D for biologicals is vastly different from small-molecule R&D. To gain these capabilities, pharmacos have three options: they can build them from scratch, partner with existing start-ups, or acquire the start-ups. Since its competitors are already several years ahead of GlobaPharm, GlobaPharm wants to jumpstart its biologicals program by acquiring BioFuture, a leading biologicals start-up based in the San Francisco area. BioFuture was founded 12 years ago by several prominent scientists and now employs 200 people. It is publicly traded and at its current share price the company is worth about \$1 billion in total.'],
    Study: ['GlobaPharm has engaged McKinsey to evaluate the BioFuture acquisition and to advise on its strategic fit with GlobaPharm\'s biologicals strategy. Our overall question today, therefore, is “Should GlobaPharm acquire BioFuture?”'],
  ),

  case_Study(
    id: 'c5',
    title: 'BILL & MELINDA GATES FOUNDATION',
    imageUrl: 'assets/images/case_study/case_private_foundation.jpg',
    ClientGoal: ['The Bill & Melinda Gates Foundation is a private organization with vast ambitions; one of its goals is to reduce extreme poverty worldwide. The foundation has asked McKinsey to design a basic financial-services offering for residents in remote communities in Mexico.'],
    Situation: ['The majority of Mexico’s rural population is relatively poor, relying in part on government benefits for their livelihood. Since they tend not to have bank accounts, they usually collect those benefits in cash from a limited number of state-owned bank branches. These branches are often a long way from where the recipients live, so it can take a lot of time and effort to collect benefits. In addition, while traveling to the branches, people can be at risk of falling victim to crime. \n\nThe Mexican government also owns and operates a chain of 22,000 stores throughout Mexico, called Diconsa, which provide basic food, clothes, and other essential goods to rural populations. These stores are supplied through a network of central and regional warehouses and several thousand delivery trucks.'],
    Study: ['McKinsey has been asked to investigate and assess the possibility of using the Diconsa network to provide a set of basic financial services to supplement the limited number of state-owned bank branches. This would start with dispensing benefit payments and would gradually grow to include savings accounts, bill payments, insurance, loans, and other financial products.'],
  ),

  case_Study(
    id: 'c6',
    title: 'SHOPS CORP.',
    imageUrl: 'assets/images/case_study/case_sales.jpg',
    ClientGoal: ['Our client is Shops Corporation. Shops Corporation approached McKinsey for help to improve diversity, equity and inclusion within their company.'],
    Situation: ['Shops Corporation, is a US-based retail company that is committed to ensuring that its own employees—especially those at their corporate headquarters—represent its customers. The majority of Shops Corporation’s customers are women, while only about a quarter of their executive team is women. The CEO has shared the following with your team. \n\nCompanies in the top-quartile for gender diversity on executive teams are more likely to outperform on profitability. \n\nCompanies in the top-quartile for ethnic/cultural diversity on executive teams are more likely to have industry-leading profitability. \n\nFor these and other reasons, Shops Corporation would like to improve diversity, equity, and inclusion throughout their organization. In particular, they are dedicated to enhancing the representation of women and other minority employees within senior leadership.'],
    Study: ['Shops Corporation has recently created full-time, director-level roles to lead a number of inclusive affinity groups and has engaged McKinsey to help Shops Corporation with their diversity and inclusion goals.'],
  ),

  case_Study(
    id: 'c7',
    title: 'SUPER SODA LTD.',
    imageUrl: 'assets/images/case_study/case_supersoda.jpg',
    ClientGoal: ['Our client is SuperSoda, a top-three beverage producer in the United States that has approached McKinsey for help designing its product launch strategy.'],
    Situation: ['As an integrated beverage company, SuperSoda leads its own brand design, marketing, and sales efforts. The company also owns its entire beverage supply chain, including production of concentrates, bottling and packaging, and distribution to retail outlets. SuperSoda has a considerable number of brands across carbonated and noncarbonated drinks, five large bottling plants throughout the country, and distribution agreements with most major retailers. \n\nSuperSoda is evaluating the launch of a new product, a flavored sports drink called “Electro-Light.” Sports drinks are usually designed to replenish energy, with sugars, and electrolytes, or salts, in the body. However, Electro-Light has been formulated to focus more on the replenishment of electrolytes and has a lower sugar content compared to most other sports drinks. The company expects this new beverage to capitalize on the recent trend away from high-sugar products.'],
    Study: ['SuperSoda’s vice president of marketing has asked McKinsey to help analyze key factors surrounding the launch of Electro-Light and its own internal capabilities to support that effort.'],
  ),
  //.....all seprated data write in above formate
];
