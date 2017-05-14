using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Wardrobe.Models;

namespace Wardrobe.Controllers
{
    public class ItemtypesController : Controller
    {
        private WardrobeEntities db = new WardrobeEntities();

        // GET: Itemtypes
        public ActionResult Index()
        {
            return View(db.Itemtypes.ToList());
        }

        // GET: Itemtypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Itemtype itemtype = db.Itemtypes.Find(id);
            if (itemtype == null)
            {
                return HttpNotFound();
            }
            return View(itemtype);
        }

        // GET: Itemtypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Itemtypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ItemTypeID,ItemType1")] Itemtype itemtype)
        {
            if (ModelState.IsValid)
            {
                db.Itemtypes.Add(itemtype);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(itemtype);
        }

        // GET: Itemtypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Itemtype itemtype = db.Itemtypes.Find(id);
            if (itemtype == null)
            {
                return HttpNotFound();
            }
            return View(itemtype);
        }

        // POST: Itemtypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ItemTypeID,ItemType1")] Itemtype itemtype)
        {
            if (ModelState.IsValid)
            {
                db.Entry(itemtype).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(itemtype);
        }

        // GET: Itemtypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Itemtype itemtype = db.Itemtypes.Find(id);
            if (itemtype == null)
            {
                return HttpNotFound();
            }
            return View(itemtype);
        }

        // POST: Itemtypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Itemtype itemtype = db.Itemtypes.Find(id);
            db.Itemtypes.Remove(itemtype);
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
