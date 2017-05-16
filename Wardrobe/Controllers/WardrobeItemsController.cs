using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using Wardrobe.Models;

namespace Wardrobe.Controllers
{
    public class WardrobeItemsController : Controller
    {
        private WardrobeEntities db = new WardrobeEntities();

        // GET: WardrobeItems
        public ActionResult Index(int itemTypeId = 0)   //Added Param To Sort ItemTypes
        {
            var wardrobeItems = db.WardrobeItems.Include(w => w.Color).Include(w => w.Itemtype).Include(w => w.Occasion).Include(w => w.Season);

            ViewBag.TypeName = "";
            if (itemTypeId > 0)
                wardrobeItems = wardrobeItems.Where(item => item.ItemTypeID == itemTypeId);
            
            if (itemTypeId==1)  //Assigning VBag to Appropriate Item Name to Use In Item Index View Page
                ViewBag.TypeName = "Tops";
            if (itemTypeId == 2)
                ViewBag.TypeName = "Bottoms";
            if (itemTypeId == 3)
                ViewBag.TypeName = "Shoe";
            if (itemTypeId == 4)
                ViewBag.TypeName = "Accessory";
          
            return View(wardrobeItems.ToList());
        }

        // GET: WardrobeItems/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WardrobeItem wardrobeItem = db.WardrobeItems.Find(id);
            if (wardrobeItem == null)
            {
                return HttpNotFound();
            }
            return View(wardrobeItem);
        }

        // GET: WardrobeItems/Create
        public ActionResult Create()
        {
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1");
            ViewBag.ItemTypeID = new SelectList(db.Itemtypes, "ItemTypeID", "ItemType1");
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "Occasion1");
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1");
            return View();
        }

        // POST: WardrobeItems/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "WardrobeItemID,ItemTypeID,Name,Image,Type,ColorID,SeasonID,OccasionID")] WardrobeItem wardrobeItem)
        {
            if (ModelState.IsValid)
            {
                db.WardrobeItems.Add(wardrobeItem);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1", wardrobeItem.ColorID);
            ViewBag.ItemTypeID = new SelectList(db.Itemtypes, "ItemTypeID", "ItemType1", wardrobeItem.ItemTypeID);
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "Occasion1", wardrobeItem.OccasionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1", wardrobeItem.SeasonID);
            return View(wardrobeItem);
        }

        // GET: WardrobeItems/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WardrobeItem wardrobeItem = db.WardrobeItems.Find(id);
            if (wardrobeItem == null)
            {
                return HttpNotFound();
            }
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1", wardrobeItem.ColorID);
            ViewBag.ItemTypeID = new SelectList(db.Itemtypes, "ItemTypeID", "ItemType1", wardrobeItem.ItemTypeID);
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "Occasion1", wardrobeItem.OccasionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1", wardrobeItem.SeasonID);
            return View(wardrobeItem);
        }

        // POST: WardrobeItems/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "WardrobeItemID,ItemTypeID,Name,Image,Type,ColorID,SeasonID,OccasionID")] WardrobeItem wardrobeItem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(wardrobeItem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ColorID = new SelectList(db.Colors, "ColorID", "Color1", wardrobeItem.ColorID);
            ViewBag.ItemTypeID = new SelectList(db.Itemtypes, "ItemTypeID", "ItemType1", wardrobeItem.ItemTypeID);
            ViewBag.OccasionID = new SelectList(db.Occasions, "OccasionID", "Occasion1", wardrobeItem.OccasionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1", wardrobeItem.SeasonID);
            return View(wardrobeItem);
        }

        // GET: WardrobeItems/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WardrobeItem wardrobeItem = db.WardrobeItems.Find(id);
            if (wardrobeItem == null)
            {
                return HttpNotFound();
            }
            return View(wardrobeItem);
        }

        // POST: WardrobeItems/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WardrobeItem wardrobeItem = db.WardrobeItems.Find(id);
            db.WardrobeItems.Remove(wardrobeItem);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
